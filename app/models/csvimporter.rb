class Csvimporter < ApplicationRecord
  require 'csv'

  def self.import(file_path)
    print "\n>>>1000000000000004\n"
    CSV.foreach(file_path, headers: true) do |row|
      csvimporter_hash = row.to_hash
      csvimporter = Csvimporter.where(id: csvimporter_hash["id"])

      if csvimporter.count == 1
        # Prevent CSV updates from changing the database comments attribute
        csvimporter.first.update_attributes(csvimporter_hash.expect("comments"))
      else
        csvimporter_hash["pri"] = csvimporter_hash.delete("Pri")
        csvimporter_hash["question"] = csvimporter_hash.delete("Question")
        csvimporter_hash["teaming"] = csvimporter_hash.delete("Teaming Stages")
        csvimporter_hash["appears"] = csvimporter_hash.delete("Appears (Day)")
        csvimporter_hash["frequency"] = csvimporter_hash.delete("Frequency")
        csvimporter_hash["qtype"] = csvimporter_hash.delete("Type")
        csvimporter_hash["role"] = csvimporter_hash.delete("Role")
        csvimporter_hash["required"] = csvimporter_hash.delete("Required?")
        csvimporter_hash["conditions"] = csvimporter_hash.delete("Conditions")
        csvimporter_hash["mapping"] = csvimporter_hash.delete("Mapping")
        csvimporter = Csvimporter.new(csvimporter_hash);
        if csvimporter.save
          print "\n\n----------success-"
        else
          print "\n\nFail---"
          puts csvimporter.errors.full_messages
        end

      end
    end
  end

  def self.search(search)
    print "\n>>>1000000000000005\n"
    if search
      where('name LIKE ?', "%#{search}%")
    else
      where(nil)
    end
  end

end
