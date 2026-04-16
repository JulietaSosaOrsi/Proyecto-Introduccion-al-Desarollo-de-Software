-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 17-06-2024 a las 04:32:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_messi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `identificacion` int(8) NOT NULL,
  `telefono` int(14) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;



--
-- Estructura de tabla para la tabla `consultas`
--

CREATE TABLE `consultas` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `contact` int(11) NOT NULL,
  `message` varchar(300) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `FAQ`
--

CREATE TABLE `FAQ` (
  `ID` int(11) NOT NULL,
  `Pregunta` longtext NOT NULL,
  `Respuesta` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `FAQ`
--

INSERT INTO `FAQ` (`ID`, `Pregunta`, `Respuesta`) VALUES
(1, '¿A partir de qué horario puedo realizar el check-in?', 'Su habitación estará disponibles a partir de las 13:00. \r\nEn el caso de que llegue por la mañana, puede dejar su equipaje en el hotel de \r\nmanera gratuita hasta que la habitación esté lista.'),
(2, '¿A qué hora tengo que realizar el check-out?', 'El día de su partida, podrá disponer de su habitación hasta el mediodía. \r\nSi su vuelo sale más tarde y desea salir para aprovechar sus últimas horas en la ciudad,\r\npodemos guardarle su equipaje de manera gratuita.'),
(3, '¿Hay acceso de Wi-Fi en el hotel? ¿Es gratuito?', 'Sí. Hay acceso a Internet inalámbrico (Wi-Fi) de banda ancha en todo el hotel'),
(4, 'Vamos a viajar en avión. ¿Cuentan con servicio de traslado desde el aeropuerto?', 'Sí, en el hotel contamos con una línea de taxis exclusiva para nuestros clientes, \r\nsi desea el servicio de traslado desde el aeropuerto no olvide indicarlo cuando realice\r\nla reserva en el hotel.'),
(5, '¿Se puede fumar en las habitaciones?', 'No. Todas las habitaciones cuentan con un detector de humo muy sensible y está prohibido fumar en las habitaciones y todo el hotel.'),
(6, '¿Aceptan animales?', 'Sí, aceptamos mascotas. Le invitamos a que nos indique este detalle en su reserva.'),
(7, '¿Cuál es el horario del desayuno?', 'El desayuno tipo buffet se sirve de 6:30 a 10:00 en el restaurante de planta baja.'),
(8, '¿Qué pueden ofrecerme fuera del horario del desayuno buffet?', 'En el último piso del hotel contamos con un restaurante abierto en el horario de 18:00 a 00:00,\r\ndonde se pueden deleitar con nuestra amplia variedad de platos y tragos de autor.\r\nTambién podrán disfrutar de nuestras ricas meriendas de 14:30 a 19:00 en el restaurante de planta baja.'),
(9, '¿Puedo modificar las fechas de mi reserva?', 'Sí, se pueden realizar modificaciones en su reserva solo 24 horas antes de la misma.'),
(10, '¿Qué formas de pago acepta el hotel?', 'Se aceptan las siguientes formas de pago: efectivo, cheque, Visa, Mastercard, American Express.\r\nPodría solicitarse un documento de identificación para pagos con cheque y tarjeta bancaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `habitaciones_disponibles`
--

CREATE TABLE `habitaciones_disponibles` (
  `id_habitacion` int(11) NOT NULL,
  `nombre_habitacion` varchar(50) NOT NULL,
  `numero_habitacion` int(11) NOT NULL,
  `piso_habitacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `habitaciones_disponibles`
--

INSERT INTO `habitaciones_disponibles` (`id_habitacion`, `nombre_habitacion`, `numero_habitacion`, `piso_habitacion`) VALUES
(1, 'Twin', 100, 1),
(2, 'Twin', 101, 1),
(3, 'Twin', 102, 1),
(4, 'Twin', 103, 1),
(5, 'Twin', 104, 1),
(6, 'Twin', 105, 1),
(7, 'Twin', 106, 1),
(8, 'Twin', 107, 1),
(9, 'Twin', 108, 1),
(10, 'Twin', 109, 1),
(11, 'Twin', 110, 1),
(12, 'Twin', 111, 1),
(13, 'Twin', 112, 1),
(14, 'Junior Suite', 113, 1),
(15, 'Junior Suite', 114, 1),
(16, 'Junior Suite', 115, 1),
(17, 'Junior Suite', 116, 1),
(18, 'Junior Suite', 117, 1),
(19, 'Junior Suite', 118, 1),
(20, 'Junior Suite', 119, 1),
(21, 'Junior Suite', 120, 1),
(22, 'Junior Suite', 121, 1),
(23, 'Junior Suite', 122, 1),
(24, 'Junior Suite', 123, 1),
(25, 'Junior Suite', 124, 1),
(26, 'Junior Suite', 125, 1),
(27, 'Deluxe Suite', 126, 1),
(28, 'Deluxe Suite', 127, 1),
(29, 'Deluxe Suite', 128, 1),
(30, 'Deluxe Suite', 129, 1),
(31, 'Deluxe Suite', 130, 1),
(32, 'Deluxe Suite', 131, 1),
(33, 'Deluxe Suite', 132, 1),
(34, 'Deluxe Suite', 133, 1),
(35, 'Deluxe Suite', 134, 1),
(36, 'Deluxe Suite', 135, 1),
(37, 'Deluxe Suite', 136, 1),
(38, 'Deluxe Suite', 137, 1),
(39, 'Deluxe Suite', 138, 1),
(40, 'Executive Suite', 139, 1),
(41, 'Executive Suite', 140, 1),
(42, 'Executive Suite', 141, 1),
(43, 'Executive Suite', 142, 1),
(44, 'Executive Suite', 143, 1),
(45, 'Executive Suite', 144, 1),
(46, 'Executive Suite', 145, 1),
(47, 'Executive Suite', 146, 1),
(48, 'Executive Suite', 147, 1),
(49, 'Executive Suite', 148, 1),
(50, 'Executive Suite', 149, 1),
(51, 'Executive Suite', 150, 1),
(52, 'Executive Suite', 151, 1),
(53, 'Twin', 200, 2),
(54, 'Twin', 201, 2),
(55, 'Twin', 202, 2),
(56, 'Twin', 203, 2),
(57, 'Twin', 204, 2),
(58, 'Twin', 205, 2),
(59, 'Twin', 206, 2),
(60, 'Twin', 207, 2),
(61, 'Twin', 208, 2),
(62, 'Twin', 209, 2),
(63, 'Twin', 210, 2),
(64, 'Twin', 211, 2),
(65, 'Junior Suite', 212, 2),
(66, 'Junior Suite', 213, 2),
(67, 'Junior Suite', 214, 2),
(68, 'Junior Suite', 215, 2),
(69, 'Junior Suite', 216, 2),
(70, 'Junior Suite', 217, 2),
(71, 'Junior Suite', 218, 2),
(72, 'Junior Suite', 219, 2),
(73, 'Junior Suite', 220, 2),
(74, 'Junior Suite', 221, 2),
(75, 'Junior Suite', 222, 2),
(76, 'Junior Suite', 223, 2),
(77, 'Junior Suite', 224, 2),
(78, 'Junior Suite', 225, 2),
(79, 'Deluxe Suite', 226, 2),
(80, 'Deluxe Suite', 227, 2),
(81, 'Deluxe Suite', 228, 2),
(82, 'Deluxe Suite', 229, 2),
(83, 'Deluxe Suite', 230, 2),
(84, 'Deluxe Suite', 231, 2),
(85, 'Deluxe Suite', 232, 2),
(86, 'Deluxe Suite', 233, 2),
(87, 'Deluxe Suite', 234, 2),
(88, 'Deluxe Suite', 235, 2),
(89, 'Deluxe Suite', 236, 2),
(90, 'Deluxe Suite', 237, 2),
(91, 'Deluxe Suite', 238, 2),
(92, 'Executive Suite', 239, 2),
(93, 'Executive Suite', 240, 2),
(94, 'Executive Suite', 241, 2),
(95, 'Executive Suite', 242, 2),
(96, 'Executive Suite', 243, 2),
(97, 'Executive Suite', 244, 2),
(98, 'Executive Suite', 245, 2),
(99, 'Executive Suite', 246, 2),
(100, 'Executive Suite', 247, 2),
(101, 'Executive Suite', 248, 2),
(102, 'Executive Suite', 249, 2),
(103, 'Executive Suite', 250, 2),
(104, 'Executive Suite', 251, 2),
(105, 'Twin', 300, 3),
(106, 'Twin', 301, 3),
(107, 'Twin', 302, 3),
(108, 'Twin', 303, 3),
(109, 'Twin', 304, 3),
(110, 'Twin', 305, 3),
(111, 'Twin', 306, 3),
(112, 'Twin', 307, 3),
(113, 'Twin', 308, 3),
(114, 'Twin', 309, 3),
(115, 'Twin', 310, 3),
(116, 'Twin', 311, 3),
(117, 'Junior Suite', 312, 3),
(118, 'Junior Suite', 313, 3),
(119, 'Junior Suite', 314, 3),
(120, 'Junior Suite', 315, 3),
(121, 'Junior Suite', 316, 3),
(122, 'Junior Suite', 317, 3),
(123, 'Junior Suite', 318, 3),
(124, 'Junior Suite', 319, 3),
(125, 'Junior Suite', 320, 3),
(126, 'Junior Suite', 321, 3),
(127, 'Junior Suite', 322, 3),
(128, 'Junior Suite', 323, 3),
(129, 'Junior Suite', 324, 3),
(130, 'Junior Suite', 325, 3),
(131, 'Deluxe Suite', 326, 3),
(132, 'Deluxe Suite', 327, 3),
(133, 'Deluxe Suite', 328, 3),
(134, 'Deluxe Suite', 329, 3),
(135, 'Deluxe Suite', 330, 3),
(136, 'Deluxe Suite', 331, 3),
(137, 'Deluxe Suite', 332, 3),
(138, 'Deluxe Suite', 333, 3),
(139, 'Deluxe Suite', 334, 3),
(140, 'Deluxe Suite', 335, 3),
(141, 'Deluxe Suite', 336, 3),
(142, 'Deluxe Suite', 337, 3),
(143, 'Deluxe Suite', 338, 3),
(144, 'Executive Suite', 339, 3),
(145, 'Executive Suite', 340, 3),
(146, 'Executive Suite', 341, 3),
(147, 'Executive Suite', 342, 3),
(148, 'Executive Suite', 343, 3),
(149, 'Executive Suite', 344, 3),
(150, 'Executive Suite', 345, 3),
(151, 'Executive Suite', 346, 3),
(152, 'Executive Suite', 347, 3),
(153, 'Executive Suite', 348, 3),
(154, 'Executive Suite', 349, 3),
(155, 'Executive Suite', 350, 3),
(156, 'Executive Suite', 351, 3),
(157, 'Twin', 400, 4),
(158, 'Twin', 401, 4),
(159, 'Twin', 402, 4),
(160, 'Twin', 403, 4),
(161, 'Twin', 404, 4),
(162, 'Twin', 405, 4),
(163, 'Twin', 406, 4),
(164, 'Twin', 407, 4),
(165, 'Twin', 408, 4),
(166, 'Twin', 409, 4),
(167, 'Twin', 410, 4),
(168, 'Twin', 411, 4),
(169, 'Junior Suite', 412, 4),
(170, 'Junior Suite', 413, 4),
(171, 'Junior Suite', 414, 4),
(172, 'Junior Suite', 415, 4),
(173, 'Junior Suite', 416, 4),
(174, 'Junior Suite', 417, 4),
(175, 'Junior Suite', 418, 4),
(176, 'Junior Suite', 419, 4),
(177, 'Junior Suite', 420, 4),
(178, 'Junior Suite', 421, 4),
(179, 'Junior Suite', 422, 4),
(180, 'Junior Suite', 423, 4),
(181, 'Junior Suite', 424, 4),
(182, 'Junior Suite', 425, 4),
(183, 'Deluxe Suite', 426, 4),
(184, 'Deluxe Suite', 427, 4),
(185, 'Deluxe Suite', 428, 4),
(186, 'Deluxe Suite', 429, 4),
(187, 'Deluxe Suite', 430, 4),
(188, 'Deluxe Suite', 431, 4),
(189, 'Deluxe Suite', 432, 4),
(190, 'Deluxe Suite', 433, 4),
(191, 'Deluxe Suite', 434, 4),
(192, 'Deluxe Suite', 435, 4),
(193, 'Deluxe Suite', 436, 4),
(194, 'Deluxe Suite', 437, 4),
(195, 'Deluxe Suite', 438, 4),
(196, 'Executive Suite', 439, 4),
(197, 'Executive Suite', 440, 4),
(198, 'Executive Suite', 441, 4),
(199, 'Executive Suite', 442, 4),
(200, 'Executive Suite', 443, 4),
(201, 'Executive Suite', 444, 4),
(202, 'Executive Suite', 445, 4),
(203, 'Executive Suite', 446, 4),
(204, 'Executive Suite', 447, 4),
(205, 'Executive Suite', 448, 4),
(206, 'Executive Suite', 449, 4),
(207, 'Executive Suite', 450, 4),
(208, 'Executive Suite', 451, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ocupacion_hotel`
--

CREATE TABLE `ocupacion_hotel` (
  `id_ocupacion` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `fecha_checkin` date NOT NULL,
  `fecha_checkout` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas`
--

CREATE TABLE `resenas` (
  `id_resena` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `titulo_resena` varchar(100) NOT NULL,
  `resena` longtext NOT NULL,
  `satisfaccion` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id_reserva` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `nombre_habitacion` varchar(50) NOT NULL,
  `fecha_checkin` date NOT NULL,
  `fecha_checkout` date NOT NULL,
  `cantidad_huespedes` int(11) NOT NULL,
  `tipo_cama` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `nombre_servicio` varchar(50) NOT NULL,
  `descripcion_servicio` text NOT NULL,
  `ruta_imagen1` varchar(100) DEFAULT NULL,
  `ruta_imagen2` varchar(50) DEFAULT NULL,
  `ruta_imagen3` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `servicios`
--

INSERT INTO `servicios` (`nombre_servicio`, `descripcion_servicio`, `ruta_imagen1`, `ruta_imagen2`, `ruta_imagen3`) VALUES
('Piscina', 'La piscina cuenta con bar integrado donde podrás disfrutar de las bebidas de tu preferencia, así como también una zona donde podrás asistir a también nuestras clases de aeróbics acuáticos, ejercicios que combinan movimiento y flexibilidad con la tranquilidad de flotar en el agua rodeados de un hermoso follaje tropical. En estas sesiones gratuitas, un instructor le guiará a través de los ejercicios con música animada para disfrutar de una experiencia divertida y vigorizante. El horario de la piscina es de 8:00 a 22:00.', '/images/pileta3.webp', '/images/pileta1.jpg', '/images/pileta2.jpg'),
('Restaurante Apolo', 'A la par de los mejores restaurantes de Copacabana, Hotel Artemisa ofrece experiencias gastronómicas para todos los gustos. Nuestro personal experimentado trae vivos todos los colores y sabores de Copacabana. Los huéspedes del hotel pueden disfrutar de una excelente cena en el restaurante donde podrán saborear la cocina tropical. Ubicado en el último piso, abierto en el horario de 18:00 a 00:00, donde se pueden deleitar con nuestra amplia variedad de platos y tragos de autor.', '/images/restaurante2.jpg', '/images/restaurante3.jpg', NULL),
('Cafetería', 'También contamos con una cafetería/pastelería para que pueda comenzar su día en Copacabana con su café recién hecho favorito y unos deliciosos dulces. Podrán disfrutar de nuestras ricas meriendas de 14:30 a 19:00. Las opciones gastronómicas son infinitas en nuestro hotel, así que asegúrese de visitar todos nuestros restaurantes y disfrutar de una aventura culinaria como ninguna otra que se pueda encontrar en Copacabana. El desayuno tipo buffet se sirve de 6:30 a 10:00 en el restaurante de planta baja.', '/images/restaurante1.jpg', '/images/restaurante4.jpeg', NULL),
('Servicio de spa', 'Tanto en el hotel como en la isla privada contamos con servicio de Spa, donde se ofrece una experiencia sensorial incomparable, desde tratamientos faciales rejuvenecedores hasta masajes relajantes realizados por expertos terapeutas. Sumérgete en nuestras piscinas climatizadas, sauna y jacuzzi, y déjate llevar por la armonía y el lujo en cada momento.', '/images/spa1.jpg', '/images/spa2.jpg', '/images/spa3.jpg'),
('Flamingo Island', 'Explore las playas cercanas Flamingo Beach y Wind Creek, solo para adultos. En minutos, el taxi acuático de nuestro hotel lo llevará a nuestra isla privada de 40 acres, donde los flamencos deambulan libremente y le esperan tratamientos relajantes en nuestro Spa. Y, con la gran variedad de restaurantes y bares que sirven de todo, desde cócteles artesanales hasta filetes auténticos, la experiencia gastronómica perfecta nunca está lejos.', '/images/flamingo1.jpg', '/images/flamingo2.jpg', NULL),
('Servicio pet-care', 'Con el servicio de guardería para mascotas puedes salir a explorar la ciudad teniendo la seguridad de que tu amigo peludo estará recibiendo los mejores cuidados en nuestro hotel. También puedes disfrutar con tu mascota en las áreas de juego designadas para su entretenimiento, las mismas se dividen en zona de gatitos y zona de perritos. ', '/images/petCare2.jpg', '/images/petCare1.jpg', '/images/petCare3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_habitaciones`
--

CREATE TABLE `tipos_habitaciones` (
  `nombre` varchar(50) NOT NULL,
  `descripcion` longtext NOT NULL,
  `amenities` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `ruta_imagen1` varchar(30) NOT NULL,
  `ruta_imagen2` varchar(30) NOT NULL,
  `ruta_imagen3` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipos_habitaciones`
--

INSERT INTO `tipos_habitaciones` (`nombre`, `descripcion`, `amenities`, `ruta_imagen1`, `ruta_imagen2`, `ruta_imagen3`) VALUES
('Deluxe Suite', 'Sumérgete en el lujo con nuestra Deluxe Suite, donde cada detalle ha sido cuidadosamente seleccionado para ofrecerte una experiencia inolvidable. Disfruta de vistas impresionantes de la ciudad desde la comodidad de tu habitación, mientras te relajas en una cama extragrande. El baño de lujo está equipado con una bañera de hidromasaje para momentos de relajación total. Además, encontrarás una amplia zona de estar separada y un servicio de conserjería personalizado para satisfacer todas tus necesidades durante tu estancia.', '[\"TV LCD\", \"Minibar\", \"Aire Acondicionado\", \"WIFI\", \"Cerradura Magnética\", \"Habitación Climatizada\", \"Bañera\", \"Caja fuerte\", \"Escritorio\", \"Artículos de Aseo\", \"Amenities\", \"Secador de Cabello\", \"Jacuzzi\", \"Teléfono\"]\r\n', 'images/SuiteLujo1.jpg', 'images/SuiteLujo2.jpg', NULL),
('Executive Suite', 'Experimenta el máximo confort y exclusividad en nuestra Executive Suite, diseñada para satisfacer las necesidades de los viajeros más exigentes. Disfruta de impresionantes vistas al mar desde tu habitación y descansa en una lujosa cama premium. La suite también cuenta con una amplia sala de estar independiente, perfecta para relajarte o para recibir a tus invitados. Además, tendrás acceso exclusivo al lounge ejecutivo, donde podrás disfrutar de servicios adicionales y atención personalizada. Y para empezar el día con energía, disfruta de un delicioso servicio de desayuno en la habitación.', '[\"TV LCD\", \"Minibar\", \"Caja Fuerte\", \"WIFI\", \"Cerradura Magnética\", \"Aire Acondicionado\", \"Habitación Climatizada\", \"Escritorio\", \"Microondas\", \"Artículos de Aseo\", \"Amenities\", \"Secador de Cabello\", \"Bañera\", \"Hidromasaje\", \"Teléfono\", \"Cafetera Nespresso\"]\r\n', 'images/Ejecutiva1.jpg', 'images/Ejecutiva2.jpg', 'images/Ejecutiva3.jpg'),
('Junior Suite', 'Sumérgete en la comodidad de nuestra Junior Suite, donde el espacio generoso se combina con un ambiente acogedor. Disfruta de una amplia área de estar perfecta para relajarte, una cama King Size para un descanso reparador y un baño privado equipado con ducha y bañera. Además, encontrarás un mini bar para satisfacer tus antojos y acceso a internet de alta velocidad para mantenerte conectado durante tu estancia.', '[\"TV LCD\",\"Microondas\", \"Caja fuerte\", \"Cerradura Magnética\", \"WIFI\", \"Aire Acondicionado\", \"Minibar\", \"Habitación Climatizada\", \"Escritorio\", \"Artículos de Aseo\",\"Amenities\", \"Secador de Cabello\", \"Bañera\", \"Teléfono\"]\r\n', 'images/SuiteJunior1.jpg', 'images/SuiteJunior2.jpg', NULL),
('Twin', 'Nuestra Twin Room ofrece una combinación perfecta de practicidad y confort. Con dos camas individuales, es ideal para amigos o familiares que prefieren tener su propio espacio para dormir. El baño privado cuenta con una maravillosa bañera apta para un relajante baño de inmersión, donde podrás liberar estrés y reponer energías, mientras que el escritorio de trabajo proporciona un espacio conveniente para trabajar o planificar tus actividades. También puedes disfrutar de entretenimiento con la televisión por cable y solicitar servicio de habitaciones las 24 horas para una experiencia aún más cómoda.', '[\"TV LCD\", \"Minibar\", \"Caja fuerte\", \"WIFI\", \"Cerradura Magnética\", \"Aire Acondicionado\", \"Habitación Climatizada\", \"Microondas\", \"Artículos de Aseo\", \"Amenities\", \"Secador de Cabello\", \"Bañera\", \"Teléfono\"]', 'images/Twin1.jpg', 'images/Twin2.jpg', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`);

--
-- Indices de la tabla `consultas`
--
ALTER TABLE `consultas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `habitaciones_disponibles`
--
ALTER TABLE `habitaciones_disponibles`
  ADD PRIMARY KEY (`id_habitacion`),
  ADD KEY `habitaciones_disponibles_ibfk_1` (`nombre_habitacion`);

--
-- Indices de la tabla `ocupacion_hotel`
--
ALTER TABLE `ocupacion_hotel`
  ADD PRIMARY KEY (`id_ocupacion`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `resenas`
--
ALTER TABLE `resenas`
  ADD PRIMARY KEY (`id_resena`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id_reserva`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_habitacion` (`id_habitacion`);

--
-- Indices de la tabla `tipos_habitaciones`
--
ALTER TABLE `tipos_habitaciones`
  ADD PRIMARY KEY (`nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `consultas`
--
ALTER TABLE `consultas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `habitaciones_disponibles`
--
ALTER TABLE `habitaciones_disponibles`
  MODIFY `id_habitacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=209;

--
-- AUTO_INCREMENT de la tabla `ocupacion_hotel`
--
ALTER TABLE `ocupacion_hotel`
  MODIFY `id_ocupacion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `resenas`
--
ALTER TABLE `resenas`
  MODIFY `id_resena` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id_reserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `habitaciones_disponibles`
--
ALTER TABLE `habitaciones_disponibles`
  ADD CONSTRAINT `habitaciones_disponibles_ibfk_1` FOREIGN KEY (`nombre_habitacion`) REFERENCES `tipos_habitaciones` (`nombre`);

--
-- Filtros para la tabla `ocupacion_hotel`
--
ALTER TABLE `ocupacion_hotel`
  ADD CONSTRAINT `ocupacion_hotel_ibfk_1` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones_disponibles` (`id_habitacion`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`),
  ADD CONSTRAINT `reserva_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones_disponibles` (`id_habitacion`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
