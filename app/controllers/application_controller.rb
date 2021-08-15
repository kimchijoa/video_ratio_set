require 'uri'
require 'net/http'

class ApplicationController < ActionController::Base
 def index
    @test = request.env["HTTP_AUTHORIZATION"]
 end

#토큰 검증기 모든 화면에서 적용될것임 메인화면 제외
def token_validate
   @token = cookies[:access_token]

   #쿠키에 토큰 값이 없다면?
   if @token.nil? 
      head(403)
      puts "you have not token"
   else
      #현재 쿠키값을 API의 토큰 검증으로 전달하여 결과값을 받는다.
      url = URI("https://kkhapi.herokuapp.com/logins/access_auth")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      #request 헤더에 추가할 값
      request["Authorization"] = @token
      response = http.request(request)

			#통신이 성공적일 경우 200
      if Net::HTTPSuccess
         puts "Success"
			#권한이 없어서 통신이 실패할 경우 403
      elsif Net::HTTPUnauthorized
         puts "Fail to Auth"
				 #head에 403에러를 추가하여 아무화면이 표시되지 않게 한다.
         head(403)
			#통신이 실패할 경우 403
      elsif Net::HTTPServerError
         puts "Fails to Sever"
				 #head에 403에러를 추가하여 아무화면이 표시되지 않게 한다.
         head(403)
			#어쨌거나 통신에 대한 응답값을 못받았을 경우 403
      else
         puts "Fail"
				 #head에 403에러를 추가하여 아무화면이 표시되지 않게 한다.
         head(403)
      end 
      end
      # 통신이 끝난뒤 통신값을 읽어오는 방법
      # puts response.read_body
      # 통신이 끝난뒤 통신값이 표현될때 문자열 오류가 나는걸 방지하기 위함
      # @test =  response.read_body.to_s.force_encoding("UTF-8")
   end

   def is_user_logined?
      !!cookies[:access_token]
   end
   helper_method :is_user_logined?
end
