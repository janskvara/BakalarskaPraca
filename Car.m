classdef Car
    properties
        name
        steeringAngle
        pubRightSteering
        msgRightSteering
        pubLeftSteering
        msgLeftSteering
        pubRightRearWheelVelocity
        msgRightRearWheelVelocity
        pubLeftRearWheelVelocity
        msgLeftRearWheelVelocity
        pubRightFrontWheelVelocity
        msgRightFrontWheelVelocity
        pubLeftFrontWheelVelocity
        msgLeftFrontWheelVelocity
        subWheelVelocity
        subSteeringAngle
        lidar
    end
    
    methods
        
      function scan = getScan(obj) 
         scan = receive(obj.lidar);
      end
      function velocity = getWheelVelocity(obj) 
         try
            velocity = obj.subWheelVelocity.LatestMessage.Data;
         catch
             velocity = 0;
         end
      end
      function angle = getSteeringAngle(obj) 
          try
              angle = obj.subSteeringAngle.LatestMessage.Data;
          catch
              angle = 0; 
          end
      end
      
      function position = getPosition(obj) 
          modelStateClient = rossvcclient('/gazebo/get_model_state');
          reqMsg = rosmessage(modelStateClient);
          reqMsg.ModelName = obj.name;
          messasge = call(modelStateClient, reqMsg);
          rawPosition = messasge.Pose.Position;
          position = [rawPosition.X,rawPosition.Y,rawPosition.Z];
      end
      
      function done = resetPosition(obj)
           setModelStateClient = rossvcclient('/gazebo/set_model_state');
           reqMsg = rosmessage(setModelStateClient);
           reqMsg.ModelState.ModelName=obj.name;
           reqMsg.ModelState.Pose=load('initializationPose.mat').initializationPose;
           reqMsg.ModelState.Twist=load('initializationTwist.mat').initializationTwist;
           call(setModelStateClient, reqMsg);
           done = true; 
      end
      
      function newObj = setSteeringAngle(obj,angleInDegrees) 
         angleInRadians =  deg2rad(angleInDegrees);
         obj.msgRightSteering.Data = angleInRadians;
         obj.msgLeftSteering.Data = angleInRadians;
         send(obj.pubRightSteering,obj.msgRightSteering);
         send(obj.pubLeftSteering,obj.msgLeftSteering);
         newObj = obj;
      end
      
      function newObj = setVelocity(obj,velocity) 
         obj.msgRightRearWheelVelocity.Data = velocity;
         obj.msgLeftRearWheelVelocity.Data = velocity;
         send(obj.pubRightRearWheelVelocity,obj.msgRightRearWheelVelocity);
         send(obj.pubLeftRearWheelVelocity,obj.msgLeftRearWheelVelocity);
         obj.msgRightFrontWheelVelocity.Data = velocity;
         obj.msgLeftFrontWheelVelocity.Data = velocity;
         send(obj.pubRightFrontWheelVelocity,obj.msgRightFrontWheelVelocity);
         send(obj.pubLeftFrontWheelVelocity,obj.msgLeftFrontWheelVelocity);
         newObj = obj;
      end
      function newObj = resetCar(obj) 
         obj.msgRightSteering.Data = 0.0;
         obj.msgLeftSteering.Data = 0.0;
         send(obj.pubRightSteering,obj.msgRightSteering);
         send(obj.pubLeftSteering,obj.msgLeftSteering);
         obj.msgRightRearWheelVelocity.Data = 0.0;
         obj.msgLeftRearWheelVelocity.Data = 0.0 ;
         send(obj.pubRightRearWheelVelocity,obj.msgRightRearWheelVelocity);
         send(obj.pubLeftRearWheelVelocity,obj.msgLeftRearWheelVelocity);
         obj.msgRightFrontWheelVelocity.Data = 0.0;
         obj.msgLeftFrontWheelVelocity.Data = 0.0;
         send(obj.pubRightFrontWheelVelocity,obj.msgRightFrontWheelVelocity);
         send(obj.pubLeftFrontWheelVelocity,obj.msgLeftFrontWheelVelocity);
         obj.msgRightRearWheelVelocity.Data = 0.0;
         obj.msgLeftRearWheelVelocity.Data = 0.0;
         send(obj.pubRightRearWheelVelocity,obj.msgRightRearWheelVelocity);
         send(obj.pubLeftRearWheelVelocity,obj.msgLeftRearWheelVelocity);
         obj.msgRightFrontWheelVelocity.Data = 0.0;
         obj.msgLeftFrontWheelVelocity.Data = 0.0;
         send(obj.pubRightFrontWheelVelocity,obj.msgRightFrontWheelVelocity);
         send(obj.pubLeftFrontWheelVelocity,obj.msgLeftFrontWheelVelocity);
         newObj = obj;
      end
    end
end