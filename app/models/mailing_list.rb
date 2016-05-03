class MailingList
  def initialize(list_id)
    @list_id = list_id
  end

  def subscribe(email)
    gibbon.lists(@list_id).members.create(
      body: {
        email_address: email,
        status: "subscribed",
        merge_fields: {
          FNAME: "First Name", # Not sure what to do with these or how exactly mailchimp is using these
          LNAME: "Last Name"
        }
      }
    )
  end

  def gibbon
    @gibbon ||= Gibbon::Request.new
  end

  def reset
    remove_instance_variable(:@gibbon)
    self
  end
end
