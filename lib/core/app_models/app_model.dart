import 'package:blush/model/catagory_model/catagory_model.dart';
import 'package:blush/model/sub_catagory_model/sub_catgory_model.dart';

class AppModelClass {
  static List<CatagoryModel> catModelList = [
    CatagoryModel(
        id: '1',
        title: 'Hair',
        discription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        imageUrl: 'assets/haircut.jpg'),
    CatagoryModel(
        id: '2',
        title: 'Face',
        discription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        imageUrl: 'assets/blackwhitefacial.jpg'),
    CatagoryModel(
        id: '3',
        title: 'Nail',
        discription:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.",
        imageUrl: 'assets/nail.jpg'),
  ];

  static List<SubCatagoryModel> subCatagoryList = [
    SubCatagoryModel(
        id: '10',
        title: 'Hair cutting',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '1',
        imageUrl: 'assets/haircutting.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '11',
        title: 'Hair Coloring',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '1',
        imageUrl: 'assets/haircoloring.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '12',
        title: 'Prebonding',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '1',
        imageUrl: 'assets/prebonding.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '13',
        title: 'Keratin',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '1',
        imageUrl: 'assets/prebonding.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '14',
        title: 'Trim',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '1',
        imageUrl: 'assets/trim.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '15',
        title: 'Facial',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '2',
        imageUrl: 'assets/facialsub.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '16',
        title: 'Bleach',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '2',
        imageUrl: 'assets/facialsub.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '17',
        title: 'Thread',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '2',
        imageUrl: 'assets/thread.jpg',
        isInCart: false),
    SubCatagoryModel(
        id: '18',
        title: 'Lip lifting',
        subCatDiscription:
            "Morbi euismod ipsum at justo egestas, vel euismod eros gravida. Vestibulum lobortis placerat urna vitae vestibulum. Donec iaculis metus ante, id volutpat nisi accumsan non. Phasellus nisl nunc, rhoncus nec interdum blandit, vehicula luctus ante. Nunc posuere sem sed ante pellentesque accumsan.",
        catId: '2',
        imageUrl: 'assets/haircut.jpg',
        isInCart: false),
  ];
}
