class PagesController < ApplicationController
    
    def index
        
    end 
    
    def registro
        
        @user = User.new
    
    end
    
    def resultados
        
        @user_id = params[:user]
        @user = User.find(@user_id)
        respuestas = @user.answers
        blocks = Block.all
        @sumas = []
        
        for b in blocks
            
            block_q = respuestas.select { |r| Question.find(r.question_id).block_id === b.id }
            
            if not block_q.empty? 
                suma = 0
                valor = ""
                block_q.each{ |r|   if r.text 
                                        suma = suma + Question.find(r.question_id).yes_value 
                                    else 
                                        suma = suma + Question.find(r.question_id).no_value 
                                    end
                }
                
                if suma < b.treshold1
                    valor = "alert alert-danger"
                elsif suma < b.treshold2 
                    valor = "alert alert-warning"
                else
                    valor = "alert alert-success"
                end
                
                @sumas.push([b.name, valor])
                
            end
        end
    end
end