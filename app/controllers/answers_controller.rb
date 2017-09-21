class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new(answer_params)

    respond_to do |format|
      if @answer.save
        format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        format.html { render :new }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    respond_to do |format|
      if @answer.update(answer_params)
        format.html { redirect_to @answer, notice: 'Answer was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer }
      else
        format.html { render :edit }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def formulario
    
    gon.questions = Question.all
    gon.questionsB = []  #Preguntas por bloque
    gon.blocks = []
    #Cagar solamente los bloques que tienen preguntas
    for b in Block.all
      if b.questions.empty?
        
      else
        
        gon.blocks.push(b)
        
      end
    
    end
    
    gon.counter = 0 #Contador de bloque
    gon.counterQ = 0 #Contador de preguntas
    gon.answers = []
    gon.user = params[:u_id]
    @user = params[:u_id]

  end
  
  def guardar #Guardar respuestas
    respuestas = params["respuestas"]
    user_id = params["user"]
    for r in respuestas
    
      question_id = r[1][1].to_i
      
      if r[1][0] === 'No'
        text = false
      else
        text = true
      end 
      
      @ans = Answer.create(text: text, question_id: question_id, user_id: user_id)

    end

    respond_to do |format|
          format.json {render :json => {:result => result}}
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_params
      params.require(:answer).permit(:text, :user_id, :question_id)
    end
end
