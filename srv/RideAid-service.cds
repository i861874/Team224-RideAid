using {RideAid} from '../db/schema';

service RideAidService {
    entity Accounts as SELECT from RideAid.Accounts;
    entity Persons as SELECT from RideAid.Persons;
    entity Roles as SELECT from RideAid.Roles;
    entity PersonRoles as SELECT from RideAid.PersonRoles;
    entity KnownDestinations as SELECT from RideAid.KnownDestinations;
    entity Appointments as SELECT from RideAid.Appointments;
    entity Trips as SELECT from RideAid.Trips;
    entity KnownDestinationsApprovals as SELECT from RideAid.KnownDestinationsApprovals;   

}

/* annotate RideAideService.Accounts with @(
    UI: {
        LineItem: [
            {$Type: 'UI.Datafield', Value: id},
            {$Type: 'UI.Datafield', Value: name}
        ]
    }

); */