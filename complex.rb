class ComplexNum
    attr_reader :real, :imaginary
    @@add_count=0
    @@multi_count=0
    @@add_bulk_count=0
    @@multiply_bulk_count=0
    
    def initialize(real, imaginary)
        @real=real
        @imaginary=imaginary
       
    end

    def +(cn)
        @@add_count+=1
        ComplexNum.new(self.real + cn.real, self.imaginary + cn.imaginary)
       
    end

    def *(cn)
        @@multi_count+=1
        ComplexNum.new(
            self.real * cn.real - self.imaginary * cn.imaginary,
            self.real * cn.imaginary + self.imaginary * cn.real
          )
    end

    def self.add_bulk(c_arr)
        @@add_bulk_count+=1
   
        sum=ComplexNum.new(0,0)
        if c_arr.length >0 then
            c_arr.each do |num|
                sum+=num
            end
        end
        return sum
    end

    def self.multiply_bulk(c_arr)
        @@multiply_bulk_count+=1
        if c_arr.length >0 then
            multi= c_arr.first #multi = arr[0]
            c_arr.drop(1).each {|num| #drop the first item from the array as it is in the multi variable
                multi*=num
            }
        end
        return multi
    end

    def self.get_stats()
        puts " Add function is used #{@@add_count} times.\n Multiply function is used #{@@multi_count} times.\n Add Bulk function is used #{@@add_bulk_count} times.\n Multiply Bulk function is used #{@@multiply_bulk_count} times."
    end
    
    

end
num1=ComplexNum.new(3,2)
num2=ComplexNum.new(1,7)
puts "------------add -------------"
add=num1+num2
puts ("#{add.real} + #{add.imaginary}i")

puts "----------------multiply------------- "
times=num1*num2
puts ("#{times.real} + #{times.imaginary}i")

puts "--------------add bulk------------"
data=[num1,num2]
add_arr=ComplexNum.add_bulk(data)
puts ("#{add_arr.real} + #{add_arr.imaginary}i")

puts "----------------multiply bulk ------------"
multi_arr=ComplexNum.multiply_bulk(data)
puts ("#{multi_arr.real} + #{multi_arr.imaginary}i")

puts "---------------------stats-----------------"
ComplexNum.get_stats()
