class ComentariosController < ApplicationController

  def new
    @comentario = Comentario.new
  end

  def destroy
    @comentario = Comentario.find(params[:id])
    @publicacion = @comentario.publicacion
    @comentario.destroy
    redirect_to publicacione_url @publicacion
  end


  def edit
    @comentario = Comentario.find(params[:id])
  end

  def update
    @comentario = Comentario.find(params[:id])
    if @comentario.update(comentario_params)
      redirect_to comentario_path(@comentario)
    else
      render 'edit'
    end

  end
  def create
    @publicacion = Publicacion.find(params[:publicacione_id])
    @comentario = @publicacion.comentarios.build(comentario_params)

    if @comentario.save
      redirect_to publicacione_url @publicacion
    else
      render 'publicaciones/show'
    end
  end

  private

  def comentario_params
    params.require(:comentario).permit(:contenido)
  end

end
