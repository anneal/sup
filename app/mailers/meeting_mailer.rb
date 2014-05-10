class MeetingMailer < ActionMailer::Base
  default from: 'sup@artsymail.com'

  def new_meeting(meeting)
    @meeting = meeting
    @members = meeting.members
    @times = [meeting.meeting_date]
    mail(to: @members.map(&:email), subject: "S'up with #{@members[0]}, #{@members[1]}, and #{@members[2]}?")
  end

  def followup(meeting)
    @meeting = meeting
    members = meeting.members
    @member = meeting.leader
    mail(to: @member.email, subject: "re: S'up with #{members[0]}, #{members[1]}, and #{members[2]}?")
  end

  def new_meeting_debug(meeting)
    @meeting = meeting
    @members = meeting.members
    @times = [meeting.meeting_date]
    mail(to: "ilya@artsymail.com",
      subject: "[SUP DEBUG] S'up with #{@members[0]}, #{@members[1]}, and #{@members[2]}?",
      template_name: 'new_meeting')
  end
end
