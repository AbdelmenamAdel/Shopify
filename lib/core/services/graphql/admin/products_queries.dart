import 'package:shopify/features/admin/products/data/models/create_product_request_body.dart';
import 'package:shopify/features/admin/products/data/models/update_product_request_body.dart';

class ProductsQueries {
  factory ProductsQueries() {
    return _instance;
  }
  const ProductsQueries._();

  static const ProductsQueries _instance = ProductsQueries._();

  //Product get all
  Map<String, dynamic> getAllProductsMapQuery() {
    return {
      'query': '''
            {
            products{
              id
              title
              price
              images
              description
              category{
                id
                name
                }
            }
          }
      ''',
    };
  }

  //Create Product
  Map<String, dynamic> createProductMapQuery({
    required CreateProductRequestBody body,
  }) {
    return {
      'query': r'''
          mutation CreateProduct($title: String!, $price: Float!, $description:String!, $categoryId: Float!,$imagesList:[String!]!  ) {
              addProduct(
                data: {
                  title: $title,
                  price: $price
                  description: $description
                  categoryId: $categoryId
                  images: $imagesList
                }
              ) {
                title
              }
            }
        ''',
      'variables': {
        'title': body.title,
        'price': body.price,
        'description': body.description,
        'categoryId': body.categoryId,
        'imagesList': body.imageList,
      },
    };
  }

  Map<String, dynamic> deleteProductMapQuery({
    required String productId,
  }) {
    return {
      'query': r'''
            mutation DeleteCategory($productId: ID!) {
              deleteProduct(id: $productId)
            }
      ''',
      'variables': {
        'productId': productId,
      },
    };
  }

  //Update Product
  Map<String, dynamic> updateProductMapQuery({
    required UpdateProductRequestBody body,
  }) {
    return {
      'query': r'''
            mutation UpdateProduct($productId: ID!, $title: String!,$description: String!,$imageList:[String!]!,$price: Float!,$categoryId: Float! ) {
          updateProduct(id: $productId,
          changes: {
            title: $title,
            categoryId: $categoryId,
            images:$imageList,
            description: $description,
            price:$price
            }) {
            title
          }
        }
        ''',
      'variables': {
        'productId': body.productId,
        'title': body.title,
        'description': body.description,
        'imageList': body.imageList,
        'categoryId': body.categoryId,
        'price': body.price,
      },
    };
  }
}
