module StudentsHelper
    def generate_avatar(name)
        AdorableAvatar.new(name).to_svg
    end
end
