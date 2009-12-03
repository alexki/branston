require 'test_helper'

class IterationsControllerTest < ActionController::TestCase

  context "The IterationsController" do

    context "when there are no iterations yet" do

      should "get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:iterations)
      end

    end

    context "when at least one iteration exists" do

      setup do
        @iteration = Iteration.make
      end

      should "get index" do
        get :index
        assert_response :success
        assert_not_nil assigns(:iterations)
      end

      should "get edit" do
        get :edit, :id => @iteration.to_param
        assert_response :success
      end

      should "get new" do
        get :new
        assert_response :success
      end

      should "show iteration" do
        get :show, :id => @iteration.to_param
        assert_response :success
      end

      should "destroy iteration" do
        assert_difference('Iteration.count', -1) do
          delete :destroy, :id => @iteration.to_param
        end

        assert_redirected_to iterations_path
      end

      context "creating an iteration" do

        context "with valid params" do
          setup do
            assert_difference("Iteration.count") do
              post :create, :iteration => Iteration.plan
            end
          end

          should "redirect to show" do
            assert_redirected_to iteration_path(assigns(:iteration))
          end
        end

        context "with invalid params" do
          setup do
            assert_no_difference("Iteration.count") do
              post :create, :iteration => {}
            end
          end

          should "redisplay" do
            assert_template 'new'
          end
        end
      end

      context "updating an iteration" do
        context "with valid parameters" do
          setup do
            assert_no_difference("Iteration.count") do
              put :update,{ :id => @iteration.id,  :iteration => {:name => "bar"}}
            end
          end

          should "redirect to show" do
            assert_redirected_to iteration_url(assigns(:iteration))
          end

        end

        context "with invalid parameters" do
          setup do
            put :update, :id => @iteration.id, :iteration => {:name => ""}
          end

          should "redisplay the edit template" do
            assert_template "edit"
          end
        end
      end
    end

  end

end

