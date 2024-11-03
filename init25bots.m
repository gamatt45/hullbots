% creates a struct of bots with fields id, location, health and an empty
% slots for neighbors and local biofouling

function bots = init25bots(health)

place = linspace(10,90,5);
location = [];
    for iiter = 1:5
        add = [repmat(place(iiter),1,5); place];
        location = cat(2,location,add);
    end

bots = struct('id',[],'neighbors',[],'health',[],'location',[],'localFouling',[],'potential',zeros(1,25),'gradient',zeros(2,25),'corner',[]);
    for ibot = 1:25
        bots(ibot).id = ibot;
        bots(ibot).health = health(ibot);
        bots(ibot).location = location(:,ibot);
    end