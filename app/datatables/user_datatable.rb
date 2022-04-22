class UserDatatable < AjaxDatatablesRails::ActiveRecord
  #self.nulls_last = true


  def view_columns
    @view_columns ||= {
      id:         { source: "User.id" },
      user_name:  { source: "User.user_name", cond: :like, searchable: true, orderable: true },
      created_at: { source: "User.created_at"},
      email:      { source: "User.email"},
    }
  end

  def data
    records.map do |record|
      {
        id:         record.id,
        user_name:  record.user_name,
        created_at: record.created_at,
        email:      record.email
      }
    end
  end

  
  def get_raw_records
    users = User.all
  end

end
