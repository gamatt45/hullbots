% creates a random health array (values 0-3) for the multi agent system 
function [health] = randHealth()
health = round(rand(1,25)*(10/5))+1;
end

