namespace RideAid;

type Address {
 /* street: String(100) not null;
    street2: String(100);
    city: String(30) not null;
    state: String(2) not null;
    zip: String(10) not null; */

    string: String(100);    // consider implementing address-cleaning as part of LAT/LONG determination.
    lat: Decimal(8,6);
    long: Decimal(9,6);
}

entity Accounts {
    key id: UUID;
    name: String(100);
    persons: Association to many Persons on persons.account = $self;
    knownDestinations: Association to many KnownDestinations on knownDestinations.account = $self;
}

entity Persons {
    key id: UUID;
    firstName: String(30);
    middleName: String(30);
    lastName: String(30);
    preferredName: String(30);
    homeAddress: Association to KnownDestinations;      // Business logic must make this a required field, and ensure that HOME is a known destination, for if Person holds role of "Traveler" 
    roles: Association to many PersonRoles on roles.person = $self;
    approvedDestinations: Association to many KnownDestinationsApprovals on approvedDestinations.rider = $self;
    account: Association to Accounts;
}

entity Roles {
    key role: String(30);
    description: String(200);
    roleHolders: Association to many PersonRoles on roleHolders.role = $self;
}

entity PersonRoles {
    key person: Association to Persons;
    key role: Association to Roles;
}

entity KnownDestinations {
    key id: UUID;
    nickname: String(30);
    name: String(40);
    address: Address;
    account: Association to Accounts;
    knownDestinationsApprovals: Association to many KnownDestinationsApprovals on knownDestinationsApprovals.knownDestination = $self;
}

entity Appointments {
    key id: UUID;
    person: Association to Persons not null;
    appointment: DateTime not null;
    name: String(40);
    location: Address not null;
}

entity Trips {
    key id: UUID;
    booked: Boolean not null;
    traveler: Association to Persons not null;
    appointment: Association to Appointments; 
    start: Address not null;
    destination: Address not null;
    scheduledAt: DateTime;                  // Business logic will make fill in the current time for trips starting "now"
    scheduledTimeMeaning: String(1);        // "D"=DepartureTime; "A"=ArrivalTime 
}

entity KnownDestinationsApprovals {
    key rider: Association to Persons;
    key knownDestination: Association to KnownDestinations;
}

