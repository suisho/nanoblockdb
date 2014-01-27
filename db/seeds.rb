# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


[Color, Shape].each do |c|
  yml = File.read("#{Rails.root}/db/seeds/#{c.to_s.tableize}.yml")
  list = YAML.load(yml)
  list.each do |r|
    c.create do |t|
      r.each do |i, v|
        unless i == 'locales'
          t.send "#{i}=", v
        end
      end
    end
  end
end