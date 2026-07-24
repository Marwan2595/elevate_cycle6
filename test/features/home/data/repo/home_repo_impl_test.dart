import 'package:elevate_cycle6/config/base_response/base_response.dart';
import 'package:elevate_cycle6/features/home/api/datasource/local/home_local_datasource_impl.dart';
import 'package:elevate_cycle6/features/home/api/datasource/remote/home_remote_datasource_impl.dart';
import 'package:elevate_cycle6/features/home/data/models/product_dto.dart';
import 'package:elevate_cycle6/features/home/data/repo/home_repo_impl.dart';
import 'package:elevate_cycle6/features/home/domain/entities/product_entity.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../helpers/product_helpers.dart';
import 'home_repo_impl_test.mocks.dart';

//Mocking
@GenerateMocks([HomeRemoteDataSourceImpl, HomeLocalDataSourceImpl])
void main() {
  late HomeRepoImpl homeRepoImpl;
  late MockHomeRemoteDataSourceImpl mockHomeRemoteDataSourceImpl;
  List<ProductDTO> dummyProductDTOs = [
    ProductDTO(id: "1", title: "Product 1", price: 100),
    ProductDTO(id: "2", title: "Product 2", price: 200),
    ProductDTO(id: "3", title: "Product 3", price: 300),
    ProductDTO(id: "4", title: "Product 4", price: 400),
    ProductDTO(id: "5", title: "Product 5", price: 500),
  ];
  String dummyErrorMessage = "Dummy Message";
  //setUp  --> function runs before each test function
  setUp(() {
    print(">>>>>>>>>>>Set Up<<<<<<<<<<<<<<");
  });
  //setUpAll
  setUpAll(() {
    print(">>>>>>>>>>>Set Up All<<<<<<<<<<<<<<");

    provideDummy<BaseResponse<List<ProductDTO>>>(
      SuccessResponse<List<ProductDTO>>([]),
    );

    MockHomeLocalDataSourceImpl mockHomeLocalDataSourceImpl =
        MockHomeLocalDataSourceImpl();
    mockHomeRemoteDataSourceImpl = MockHomeRemoteDataSourceImpl();
    homeRepoImpl = HomeRepoImpl(
      mockHomeRemoteDataSourceImpl,
      mockHomeLocalDataSourceImpl,
    );
  });
  //tearDown
  tearDown(() {
    print(">>>>>>>>>>>Tear Down<<<<<<<<<<<<<<");
  });
  //tearDownAll
  tearDownAll(() {
    print(">>>>>>>>>>>Tear Down All<<<<<<<<<<<<<<");
  });
  group("Get Products Function Tests", () {
    test('Success with non-empty productDTO list 5 products', () async {
      //AAA
      //Arrange

      when(mockHomeRemoteDataSourceImpl.getProducts(categoryId: "")).thenAnswer(
        (_) async => SuccessResponse<List<ProductDTO>>(dummyProductDTOs),
      );

      //Act
      final result = await homeRepoImpl.getProducts();

      //Assert
      expect(result, isA<SuccessResponse<List<ProductEntity>>>());
      (result as SuccessResponse<List<ProductEntity>>); //Casting
      expect(result.data.length, dummyProductDTOs.length);

      //Check that 1st DTO converted correctly to entity
      isProductEntityMatchDTO(result.data.first, dummyProductDTOs.first);
    });
    test('Success with empty productDTO list', () async {
      //AAA
      //Arrange
      when(
        mockHomeRemoteDataSourceImpl.getProducts(categoryId: ""),
      ).thenAnswer((_) async => SuccessResponse<List<ProductDTO>>([]));

      //Act
      final result = await homeRepoImpl.getProducts();

      //Assert
      expect(result, isA<SuccessResponse<List<ProductEntity>>>());
      (result as SuccessResponse<List<ProductEntity>>); //Casting
      expect(result.data, isEmpty);
      expect(result.data.length, isZero);
    });
    test('Error with error message', () async {
      //AAA
      //Arrange
      when(mockHomeRemoteDataSourceImpl.getProducts(categoryId: "")).thenAnswer(
        (_) async =>
            ErrorResponse<List<ProductDTO>>(errMessage: dummyErrorMessage),
      );

      //Act
      final result = await homeRepoImpl.getProducts();

      //Assert
      expect(result, isA<ErrorResponse<List<ProductEntity>>>());
      (result as ErrorResponse<List<ProductEntity>>); //Casting
      expect(result.errMessage, isNotEmpty);
      expect(result.errMessage, isNotNull);
      expect(result.errMessage, dummyErrorMessage);
    });
  });
}
