class VisaApplicationData {
  // Personal Information
  String fullName = '';
  String placeOfBirth = '';
  String dateOfBirth = '';
  String sex = '';
  String maritalStatus = '';
  String profession = '';
  String qualification = '';
  String placeOfIssue = '';
  // File? picture; // Added a field for storing the image file

  // Contact Information
  String phoneNumber = '';
  String email = '';
  String address = '';

  // Family Information
  String motherName = '';
  String religion = '';
  String sect = '';

  // Passport Details
  String passportNumber = '';
  String dateOfPassportIssued = '';
  String placeOfIssue2 = '';
  String dateOfPassportExpired = '';
  String purposeOfTravel = '';

  // Visa Details
  String visaType = '';
  String purposeOfVisit = '';
  String lengthOfStay = '';


  String dateOfDeparture = '';
  String dateOfArrival = '';
  String durationOfStayInKingdom = '';
  String modeOfPayment = '';
  // Constructor
  VisaApplicationData({
    this.fullName = '',
    this.placeOfBirth = '',
    this.dateOfBirth = '',
    this.sex = '',
    this.maritalStatus = '',
    this.profession = '',
    this.qualification = '',
    this.placeOfIssue = '',
    // this.picture,
    this.phoneNumber = '',
    this.email = '',
    this.address = '',
    this.motherName = '',
    this.religion = '',
    this.sect = '',
    this.passportNumber = '',
    this.dateOfPassportIssued = '',
    this.placeOfIssue2 = '',
    this.dateOfPassportExpired = '',
    this.purposeOfTravel = '',
    this.visaType = '',
    this.purposeOfVisit = '',
    this.lengthOfStay = '',
    this.dateOfDeparture = '',
    this.dateOfArrival = '',
    this.durationOfStayInKingdom = '',
    this.modeOfPayment = '',
  });
}
