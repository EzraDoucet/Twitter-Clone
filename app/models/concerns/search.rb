def self.search_by_name_or_message(search_string)
  where("name ILIKE ? OR message ILIKE ?", "%#{search_string}%", "%#{search_string}")
end