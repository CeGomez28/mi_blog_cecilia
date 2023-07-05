class PublicacionesController < ApplicationController
  def index
  @publicaciones = Publicacion.includes(:comentarios).all
end

def show
  @publicacion = Publicacion.includes(:comentarios).find(params[:id])
  @comentario = Comentario.new
end
 
def destroy
  @publicacion = Publicacion.find(params[:id])
  @publicacion.destroy
  redirect_to publicaciones_path
end

def edit
  @publicacion = Publicacion.find(params[:id])
end

def update
  @publicacion = Publicacion.find(params[:id])
  if @publicacion.update(formulario_params)
    redirect_to publicacione_path(@publicacion)
  else
    render 'edit'
  end
end

def new
  @publicacion = Publicacion.new
end


  def create
    @publicacion = current_user.publicacions.new(formulario_params)
    if @publicacion.save
      redirect_to publicaciones_path
    else
      render :new
    end
  end


  private

  def formulario_params
    params.require(:publicacion).permit(:titulo, :descripcion)
  end
end
