import 'package:flashnews/features/model/category_model.dart';
import 'package:iconsax/iconsax.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Bussines";
  categoryModel.icon = Iconsax.message_square;
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Entertaintment";
  categoryModel.icon = Iconsax.mobile;
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "General";
  categoryModel.icon = Iconsax.home_1;
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Health";
  categoryModel.icon = Iconsax.hospital;
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Sport";
  categoryModel.icon = Iconsax.flag;
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Science";
  categoryModel.icon = Iconsax.sun;
  category.add(categoryModel);
  categoryModel = CategoryModel();

  categoryModel.categoryName = "Tecnology";
  categoryModel.icon = Iconsax.setting4;
  category.add(categoryModel);
  categoryModel = CategoryModel();

  return category;
}
