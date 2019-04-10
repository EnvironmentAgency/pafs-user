module Seeds
  class Development < Base
    def apply
      import_areas unless areas_imported?

      frontend_user.save!
      frontend_user.user_areas.create!(area_id: area.id, primary: true)
    end

    def self.applicable?
      Rails.env.development?
    end

    private

    def frontend_user
      @frontend_user ||= User.new(
        first_name: 'Joe',
        last_name: 'Bloggs',
        email: 'user@example.com',
        password: 'Password123!',
        password_confirmation: 'Password123!',
        admin: false
      )
    end

    def area
      @area ||= PafsCore::Area.pso_areas.first
    end

    def import_areas
      areas_csv = Rails.root.join("lib/fixtures/areas.csv")
      PafsCore::AreaImporter.new.import(areas_csv)
    end

    def areas_imported?
      PafsCore::Area.count > 0
    end
  end
end
