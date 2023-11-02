user = User.find_by(name: "Surveillance")
region = Region.first

user.monitored_regions << region
