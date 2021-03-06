class Doctor
    attr_reader :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient,date)
        Appointment.new(patient,date,self)
    end

    def appointments
        Appointment.all.select {|appt| appt.doctor == self }
    end

    def patients
        self.appointments.map {|appt| appt.patient }
    end
end