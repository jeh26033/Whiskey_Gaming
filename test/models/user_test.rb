require 'test_helper'

class UserTest < ActiveSupport::TestCase
	def setup
		@user =User.new(name: 'Example User', email: 'example@email.com',
		password: "foobar", password_confirmation: "foobar")
	end
#ensures the user is 'valid'
	test 'should be valid' do
		assert @user.valid?		
	end
#checks that the name isn't an empty string
	test "name should be present" do
		@user.name=' '
		assert_not @user.valid?
	end
#checks that the email isn't an empty string
	test "email should be present" do
		@user.email=' '
		assert_not @user.valid?
	end
#ensures the user's name isn't over 50 char long
	test "name should not be too long" do
		@user.name = "a" * 51
		assert_not @user.valid?
	end
#checks the email isn't over 244 char long
	test "email should not be too long" do
		@user.email = "a" * 244 + "@example.com"
		assert_not @user.valid?
	end
#checks for a valid email
	test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
		@user.email = valid_address
		assert @user.valid?, "#{valid_address.inspect} should be valid"
	  end
	end
#checks for invalid email
	test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    	end
  	end
#ensures the email address is unique
  	test "email addresses should be unique" do
    	duplicate_user = @user.dup
    	duplicate_user.email = @user.email.upcase
    	@user.save
    	assert_not duplicate_user.valid?
  	end
#checks for nonblank password
	test "password should be present (nonblank)" do
		@user.password = @user.password_confirmation = " " * 6
		assert_not @user.valid?
	end
#checks for min length, at least 5 long.
	test "password should have a minimum length" do
		@user.password = @user.password_confirmation = "a" * 5
		assert_not @user.valid?
	end

end
