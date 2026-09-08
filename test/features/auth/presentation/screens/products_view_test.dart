import 'package:elevate_cycle6/features/auth/presentation/cubit/cubit.dart';
import 'package:elevate_cycle6/features/auth/presentation/cubit/product_model.dart';
import 'package:elevate_cycle6/features/auth/presentation/cubit/state.dart';
import 'package:elevate_cycle6/features/auth/presentation/screens/products_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'products_view_test.mocks.dart';

@GenerateMocks([ProductsCubit])
void main() {
  late MockProductsCubit mockProductsCubit;

  setUp(() {
    mockProductsCubit = MockProductsCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<ProductsCubit>(
        create: (context) => mockProductsCubit,
        child: ProductsView(),
      ),
    );
  }

  testWidgets('Loading State .....', (WidgetTester tester) async {
    //AAA
    //Arrange
    when(
      mockProductsCubit.state,
    ).thenReturn(ProductsState(isLoading: true, errorMessage: null));

    when(mockProductsCubit.stream).thenAnswer(
      (_) => Stream<ProductsState>.value(
        ProductsState(isLoading: true, errorMessage: null),
      ),
    );
    //Act
    await tester.pumpWidget(createWidgetUnderTest());
    //Assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
    expect(find.text('No products available'), findsNothing);
    expect(find.text('Failed to load products'), findsNothing);
  });
  testWidgets('Error State .....', (WidgetTester tester) async {
    //AAA
    //Arrange
    String errorMessage = 'Failed tosdfvdvsdsdfucts';
    when(
      mockProductsCubit.state,
    ).thenReturn(ProductsState(isLoading: false, errorMessage: errorMessage));

    when(mockProductsCubit.stream).thenAnswer(
      (_) => Stream<ProductsState>.value(
        ProductsState(isLoading: false, errorMessage: errorMessage),
      ),
    );
    //Act
    await tester.pumpWidget(createWidgetUnderTest());
    //Assert
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
    expect(find.text('No products available'), findsNothing);
    expect(find.text(errorMessage), findsOneWidget);
  });

  testWidgets('Empty Success State .....', (WidgetTester tester) async {
    //AAA
    //Arrange
    String emptyMessage = 'No products available';
    when(mockProductsCubit.state).thenReturn(
      ProductsState(isLoading: false, products: [], errorMessage: null),
    );

    when(mockProductsCubit.stream).thenAnswer(
      (_) => Stream<ProductsState>.value(
        ProductsState(isLoading: false, errorMessage: null, products: []),
      ),
    );
    //Act
    await tester.pumpWidget(createWidgetUnderTest());
    //Assert
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
    expect(find.text(emptyMessage), findsOneWidget);
    expect(find.text('Failed to load products'), findsNothing);
  });
  testWidgets('Non-Empty Success State .....', (WidgetTester tester) async {
    //AAA
    //Arrange
    String emptyMessage = 'No products available';
    List<Product> dummyProducts = [
      Product(
        id: 1,
        name: 'Product 1',
        price: 99.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        id: 2,
        name: 'Product 2',
        price: 149.99,
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];

    when(mockProductsCubit.state).thenReturn(
      ProductsState(
        isLoading: false,
        products: dummyProducts,
        errorMessage: null,
      ),
    );

    when(mockProductsCubit.stream).thenAnswer(
      (_) => Stream<ProductsState>.value(
        ProductsState(
          isLoading: false,
          errorMessage: null,
          products: dummyProducts,
        ),
      ),
    );

    //Act
    await tester.pumpWidget(createWidgetUnderTest());
    //Assert
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Products'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(Card), findsNWidgets(dummyProducts.length));
    expect(find.text(emptyMessage), findsNothing);
    expect(find.text('Failed to load products'), findsNothing);
  });
}



// DS & Algorithms 4
// Flavors
// Packages 
// Security
// AI
// Job Hunt
// Devtools -> Performance, Memory, Network, Inspector, Logging, Debugger
//  