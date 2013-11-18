class Car

	@@colors=Hash.new(0)
	@@total_car_count = 0
	@@total_distance=0

    def self.total_car_count
        @@total_car_count
    end	
    def self.total_distance
        @@total_distance
    end	

	def to_s()
		"I'm a car! I've driven #{@distance} and have #{@fuel} gallons gas left"
	end

	def initialize(color)
		@fuel = 10
		@distance = 0
		@@total_car_count+=1
		@color=color
		@@colors[color.to_sym]+=1
	end
	def distance
		@distance
	end

	def self.total_colors
		@@colors.each { |k,v|  puts "#{k}: #{v}"}
	end

	def self.most_popular_color
		@@colors.max_by { |a, b| b }[0].to_s
	end

	def color=(color)
		puts "the color was #{@color}"
		@@colors[@color.to_sym]-=1
		@color=color
		@@colors[color.to_sym]+=1
		puts "the color is now #{@color}"
	end

	def drive(miles)
		if (@fuel - miles/20.0) >= 0
			@distance += miles
			@@total_distance += miles
			@fuel -= miles/20.0
		else
			@distance += @fuel * 20.0
			@@total_distance += @fuel * 20.0
			@fuel = 0
			puts "You're out of gas!"
		end
	end

	def fuel_up()
		gallons_needed = 10.0 - @fuel
		puts "You must pay $#{3.5 * gallons_needed}"
		@fuel = 10.0
	end
end

class ConvertibleCar < Car
	
	# in roof_status, false is uncovered, true is covered
	def initialize(color)
		super(color)
		@roof_status=false
	end

	def top_down
		if @roof_status
			@roof_status=false
		else
			"it is already uncovered"
		end
	end

	def close_top
		if @roof_status
			"it is already covered"
		else			
			@roof_status=true
		end
	end

	def roof_status
		@roof_status
	end
end

car_a = Car.new("blue")
car_b = Car.new("blue")
car_c = Car.new("red")
Car.total_colors
car_a.drive(10)
puts car_a
puts car_b
car_a.drive(232)
car_b.drive(117)
puts "----"
p best_color = Car.most_popular_color
car_d = Car.new(best_color)
car_c.color=("green")
p Car.total_distance

maseratti= ConvertibleCar.new("red")
p maseratti.roof_status
p maseratti.close_top
p maseratti.roof_status
p maseratti.top_down
p maseratti.roof_status
p maseratti.distance