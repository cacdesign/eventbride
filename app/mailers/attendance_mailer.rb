class AttendanceMailer < ApplicationMailer
 
  def attendance_email(attendance)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user

    @event = attendance.event
    @admin = attendance.event.admin

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Vous avez un nouveau participant !') 
  end

  
end