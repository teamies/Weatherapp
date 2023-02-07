
/**
 * Do bị ngu nên phải làm cái dịch này 
 * 
 * @parame
 * 
 * check Nếu bằng true thì là ban đêm
 * String
 * 
 * @return String 
 */
String Traslate (bool check , String descriptionVN){
    String description = '';
    switch (descriptionVN) {
      case 'few clouds':
        description = 'Có mây';
        break;
      case 'scattered clouds':
        description ='Ít mây';
        break;
      case 'broken clouds':
        description ='Nhiều mây';
        break;
      case 'overcast clouds':
        description ='Mây đen';
        break;

      case 'light rain':
        description ='Mưa nhỏ';
        break;
      case 'moderate rain':
        description ='Mưa vừa';
        break;
      case 'clear sky':
        description = (check)? 'Trời quang': 'Trời Nắng';
        break;
      
    }
    return description;
  }