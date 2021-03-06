class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :subscribe]
 
 
 
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @allele = Ele.all
    @allpro = Pro.all
    
    if @event.naturecreateur == "eleve"
      @creator = Ele.find(@event.creator_id)
    elsif @event.naturecreateur == "professeur"
      @creator = Pro.find(@event.creator_id)
      @professor = Pro.find(@event.professor_id)
    else
    end
    if @event.professeur == "present"
      @professor = Pro.find(@event.professor_id)
    else
    end
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json


  def create
    @event = Event.new(event_params)
    @event.professeur = "vide"
    @event.etat = "open"
    if ele_signed_in?
      @event.creator_id = current_ele.id
      @event.naturecreateur = "eleve"
    elsif pro_signed_in?
      @event.creator_id = current_pro.id
      @event.naturecreateur = "professeur"
      @event.professeur = "present"
      @event.professor_id = current_pro.id
    else
    end
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end






  def subscribe
    @event = Event.find(params[:id])
    if 
      ele_signed_in? && @event.asubscribe == nil
      @event.update_columns(asubscribe: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe2 == nil
      @event.update_columns(asubscribe2: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe3 == nil
      @event.update_columns(asubscribe3: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe4 == nil
      @event.update_columns(asubscribe4: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe5 == nil
      @event.update_columns(asubscribe5: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe6 == nil
      @event.update_columns(asubscribe6: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe7 == nil
      @event.update_columns(asubscribe7: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe8 == nil
      @event.update_columns(asubscribe8: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe9 == nil
      @event.update_columns(asubscribe9: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe10 == nil
      @event.update_columns(asubscribe10: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      pro_signed_in? && @event.professor_id == nil
      @event.update_columns(professor_id: current_pro.id)
      @event.update_columns(professeur: "present")
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    else
      flash[:danger] = "Vous participez déjà à l'événement !"
      redirect_to "/"
    end
  end



  def addeletoinvitation  
    @ele = Ele.find(params[:ele_id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.eleinvitatees << @ele
    flash[:success] = "#{@ele.firstname} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end


  def addprotoinvitation  
    @pro = Pro.find(params[:pro_id])
    @event = Event.find(params[:test])
 #   if 
 #   @event.attendees.include? @user
 #   flash[:danger] = "#{@user.name} participe déjà à l'événement !" 
 #   redirect_to @event
 #   else
    @event.proinvitatees << @pro
    flash[:success] = "#{@pro.firstname} est ajouté à l'événement ! !" 
    redirect_to @event
 #   end
  end


  def closingevent
    @event = Event.find(params[:id])
    @event.update_columns(etat: "close")
  # il faudra qu'elle envoie un mail à tous les ele enregistrés dans @event.subscribeX
  # "le prof a validé l'event, allez sur la page de l'event pour payer et recevoir votre pass"
    redirect_to @event
  end


  def pay
    @event = Event.find(params[:id])
# faire payer grace a stripe et une fois que c'est fait, envoie de l'email avec pass
    if 
      ele_signed_in? && @event.apayer == nil
      @event.update_columns(apayer: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer2 == nil
      @event.update_columns(apayer2: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer3 == nil
      @event.update_columns(apayer3: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer4 == nil
      @event.update_columns(apayer4: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer5 == nil
      @event.update_columns(apayer5: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer6 == nil
      @event.update_columns(apayer6: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer7 == nil
      @event.update_columns(apayer7: current_ele.id)
    elsif
      ele_signed_in? && @event.asubscribe8 == nil
      @event.update_columns(apayer8: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer9 == nil
      @event.update_columns(apayer9: current_ele.id)
    elsif
      ele_signed_in? && @event.apayer10 == nil
      @event.update_columns(apayer10: current_ele.id)
    else
    end
    redirect_to @event
  end

  def subscibeandpay
    @event = Event.find(params[:id])
    @event = Event.find(params[:id])
    if 
      ele_signed_in? && @event.asubscribe == nil
      @event.update_columns(asubscribe: current_ele.id)
      @event.update_columns(apayer: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe2 == nil
      @event.update_columns(asubscribe2: current_ele.id)
      @event.update_columns(apayer2: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe3 == nil
      @event.update_columns(asubscribe3: current_ele.id)
      @event.update_columns(apayer3: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe4 == nil
      @event.update_columns(asubscribe4: current_ele.id)
      @event.update_columns(apayer4: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe5 == nil
      @event.update_columns(asubscribe5: current_ele.id)
      @event.update_columns(apayer5: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe6 == nil
      @event.update_columns(asubscribe6: current_ele.id)
      @event.update_columns(apayer6: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe7 == nil
      @event.update_columns(asubscribe7: current_ele.id)
      @event.update_columns(apayer7: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe8 == nil
      @event.update_columns(asubscribe8: current_ele.id)
      @event.update_columns(apayer8: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe9 == nil
      @event.update_columns(asubscribe9: current_ele.id)
      @event.update_columns(apayer9: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      ele_signed_in? && @event.asubscribe10 == nil
      @event.update_columns(asubscribe10: current_ele.id)
      @event.update_columns(apayer10: current_ele.id)
      @event.eleattendees << current_ele
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    elsif
      pro_signed_in? && @event.professor_id == nil
      @event.update_columns(professor_id: current_pro.id)
      @event.update_columns(professeur: "present")
      flash[:success] = "Vous participez à l'événement en tant qu'élève!" 
      redirect_to "/"
    else
      flash[:danger] = "Vous participez déjà à l'événement !"
      redirect_to "/"
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from  the scary internet, only allow the white list through.
    def event_params
      params.fetch(:event, {})
      params.require(:event).permit(:name, :discipline, :description, :date, :ville, :prix)
    end
end
