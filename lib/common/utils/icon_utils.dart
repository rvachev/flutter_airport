String getIconCompany(String company) {
  switch (company) {
    case 'S7':
      return 'assets/company_icons/s7.png';
    case 'UTair':
      return 'assets/company_icons/utair.png';
    case 'UVT Aero':
      return 'assets/company_icons/uvt.png';
    default:
      return 'assets/company_icons/default.png';
  }
}
