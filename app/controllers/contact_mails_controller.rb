class ContactMailsController < ApplicationController
  # GET /contact_mails
  # GET /contact_mails.xml
  def index
    @contact_mails = ContactMail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_mails }
    end
  end

  # GET /contact_mails/1
  # GET /contact_mails/1.xml
  def show
    @contact_mail = ContactMail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_mail }
    end
  end

  # GET /contact_mails/new
  # GET /contact_mails/new.xml
  def new
    @contact_mail = ContactMail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_mail }
    end
  end

  # GET /contact_mails/1/edit
  def edit
    @contact_mail = ContactMail.find(params[:id])
  end

  # POST /contact_mails
  # POST /contact_mails.xml
  def create
    @contact_mail = ContactMail.new(params[:contact_mail])

    respond_to do |format|
      if @contact_mail.save
	    #send email
		ContactMailer.send_contact_us_email(@contact_mail).deliver 
        format.html { redirect_to(@contact_mail, :notice => 'Email has been delivered.') }
        format.xml  { render :xml => @contact_mail, :status => :created, :location => @contact_mail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_mail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_mails/1
  # PUT /contact_mails/1.xml
  def update
    @contact_mail = ContactMail.find(params[:id])

    respond_to do |format|
      if @contact_mail.update_attributes(params[:contact_mail])
        format.html { redirect_to(@contact_mail, :notice => 'Contact mail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_mail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_mails/1
  # DELETE /contact_mails/1.xml
  def destroy
    @contact_mail = ContactMail.find(params[:id])
    @contact_mail.destroy

    respond_to do |format|
      format.html { redirect_to(contact_mails_url) }
      format.xml  { head :ok }
    end
  end
end
