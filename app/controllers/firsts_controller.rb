require 'uri'
require 'net/http'

class FirstsController < ApplicationController
  before_action :set_first, only: %i[ show edit update destroy ]
  before_action :token_validate, only: %i[ token_test ]

  # GET /firsts or /firsts.json
  def index
    @token = cookies[:access_token]
    headers["Authorization"] = @token
  end

  def logout
    cookies.delete :access_token
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
