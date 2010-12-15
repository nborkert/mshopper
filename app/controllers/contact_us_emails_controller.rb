class ContactUsEmailsController < ApplicationController
  skip_before_filter  :authorize

  # GET /contact_us_emails
  # GET /contact_us_emails.xml
  def index
    @contact_us_emails = ContactUsEmail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_us_emails }
    end
  end

  # GET /contact_us_emails/1
  # GET /contact_us_emails/1.xml
  def show
    @contact_us_email = ContactUsEmail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_us_email }
    end
  end

  # GET /contact_us_emails/new
  # GET /contact_us_emails/new.xml
  def new
    @contact_us_email = ContactUsEmail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_us_email }
    end
  end

  # GET /contact_us_emails/1/edit
  def edit
    @contact_us_email = ContactUsEmail.find(params[:id])
  end

  # POST /contact_us_emails
  # POST /contact_us_emails.xml
  def create
    @contact_us_email = ContactUsEmail.new(params[:contact_us_email])

    respond_to do |format|
      if @contact_us_email.save
	    ContactMailer.send_contact_us_email(@contact_us_email).deliver
        format.html { redirect_to(@contact_us_email, :notice => 'Email has been sent.') }
        format.xml  { render :xml => @contact_us_email, :status => :created, :location => @contact_us_email }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_us_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_us_emails/1
  # PUT /contact_us_emails/1.xml
  def update
    @contact_us_email = ContactUsEmail.find(params[:id])

    respond_to do |format|
      if @contact_us_email.update_attributes(params[:contact_us_email])
        format.html { redirect_to(@contact_us_email, :notice => 'Contact us email was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_us_email.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_us_emails/1
  # DELETE /contact_us_emails/1.xml
  def destroy
    @contact_us_email = ContactUsEmail.find(params[:id])
    @contact_us_email.destroy

    respond_to do |format|
      format.html { redirect_to(contact_us_emails_url) }
      format.xml  { head :ok }
    end
  end
end
