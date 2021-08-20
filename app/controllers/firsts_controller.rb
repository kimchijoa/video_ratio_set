require 'uri'
require 'net/http'

class FirstsController < ApplicationController
  before_action :set_cookie
  before_action :cookie_call
  before_action :set_first, only: %i[ show edit update destroy ]
  before_action :token_validate, only: %i[ content01 token_test register ]
  
  # GET /firsts or /firsts.json
  def index
    # @token = cookies[:access_token]
    # headers["Authorization"] = @token

  end

  def login
    #at_token 값이 있다면? 이미 로그인 한 것임
    
    # 변수.nil? 실제 변수가 존재한다면 실행 X 
    unless params[:path].nil?
      puts "파라미터를 받음"
      unless cookies[:access_token].nil? 
        puts "aceess_token이 있다."
        if cookies[:at_token].nil?
          puts "at_token이 없다."
          #access_token 값이 없다면
          cookies[:at_token] = cookies[:access_token]
          cookies.delete :access_token
          puts "일반적인 로그인 시도"
          redirect_to root_path
        end
      end

    else
      #access_token 값이 존재한다면
      unless cookies[:access_token].nil?
        puts "aceess_token이 있다."
        unless cookies[:at_token].nil?
          puts "at_token이 있다."
          cookies.delete :access_token
          cookies.delete :at_token
          puts "이게 한번이라도 로그인 한경우"
        end
      end
    end
    
  end

  def register
    
  end

  def content01
    #쉘 스크립트 파일 실행
    system("sh test_shell")
  end

  def logout
    cookies.delete :at_token

    respond_to do |format|
      format.js {render inline: "location.reload();" }
    end
    # session.clear
    # respond_to do |format|
    #   format.js
    # end
  end 

  def token_test
    @dataJson = { :message => "[Test] Token 인증 되었습니다! :D 로그인 이후 표시될 페이지 표현"}
    render :json => @dataJson
  end

  # GET /firsts/1 or /firsts/1.json
  def show
  end

  # GET /firsts/new
  def new
    @first = First.new
  end

  # GET /firsts/1/edit
  def edit
  end

  # POST /firsts or /firsts.json
  def create
    @first = First.new(first_params)

    respond_to do |format|
      if @first.save
        format.html { redirect_to @first, notice: "First was successfully created." }
        format.json { render :show, status: :created, location: @first }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @first.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /firsts/1 or /firsts/1.json
  def update
    respond_to do |format|
      if @first.update(first_params)
        format.html { redirect_to @first, notice: "First was successfully updated." }
        format.json { render :show, status: :ok, location: @first }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @first.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /firsts/1 or /firsts/1.json
  def destroy
    @first.destroy
    respond_to do |format|
      format.html { redirect_to firsts_url, notice: "First was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first
      @first = First.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def first_params
      params.fetch(:first, {})
    end
end
