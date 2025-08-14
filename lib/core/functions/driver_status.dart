getDriverStatus(dynamic status) {
  if (status is int) {
    switch (status) {
      case 0:
        return "لم يستلمها السائق بعد";
      case 1:
        return "تم استلام الرحلة";
      case 2:
        return "فى الأتجاه للعميل";
      case 3:
        return "تم الوصول للعميل";
      case 4:
        return "تم استلام العميل";
      case 5:
        return "تم توصيل العميل بنجاح";
      default:
        return "لم يستلمها السائق بعد";
    }
  }
  if (status is String) {
    switch (status) {
      case "لم يستلمها السائق بعد":
        return 0;
      case "تم استلام الرحلة":
        return 1;
      case "فى الأتجاه للعميل":
        return 2;
      case "تم الوصول للعميل":
        return 3;
      case "تم استلام العميل":
        return 4;
      case "تم توصيل العميل بنجاح":
        return 5;
      default:
        return 0;
    }
  }
}
