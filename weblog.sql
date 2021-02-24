-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 24, 2021 at 10:17 PM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `weblog`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `sno` int(11) NOT NULL,
  `FirstName` text NOT NULL,
  `LastName` text NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Phone` varchar(10) NOT NULL,
  `Msg` text NOT NULL,
  `dt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(4) NOT NULL,
  `title` text NOT NULL,
  `slug` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `img_file` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `slug`, `content`, `date`, `img_file`) VALUES
(1, 'Welcome in the world of Python And Flask', 'first-post', 'If you\'re developing a web app in Python, chances are you\'re leveraging a framework. A framework \"is a code library that makes a developer\'s life easier when building reliable, scalable, and maintainable web applications\" by providing reusable code or extensions for common operations. There are a number of frameworks for Python, including Flask, Tornado, Pyramid, and Django. New Python developers often ask: Which framework should I use?\r\n\r\nThis series is designed to help developers answer that question by comparing those four frameworks. To compare their features and operations, I\'ll take each one through the process of constructing an API for a simple To-Do List web application. The API is itself fairly straightforward:\r\nNew visitors to the site should be able to register new accounts.\r\nRegistered users can log in, log out, see information for their profiles, and edit their information.\r\nRegistered users can create new task items, see their existing tasks, and edit existing tasks.\r\nAll this rounds out to a compact set of API endpoints that each backend must implement, along with the allowed HTTP methods:\r\n\r\nGET /\r\nPOST /accounts\r\nPOST /accounts/login\r\nGET /accounts/logout', '2021-02-24 01:42:17', 'blog.jpg'),
(2, 'Lorem Ipsum', 'second-post', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nWhy do we use it?\r\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).\r\n\r\n\r\nWhere does it come from?\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.\r\n\r\nWhere can I get some?\r\nThere are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', '2021-02-24 01:47:50', 'bg-image.jpg'),
(3, 'The Third One', 'third-post', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo cupiditate quas at velit modi magni praesentium? Obcaecati libero rem ducimus quo totam cum voluptate excepturi sequi dolorum doloremque expedita repellat vel fuga, omnis eveniet est fugit voluptates incidunt unde dolores explicabo ipsam accusantium. Ipsam, molestiae facilis! In iusto nemo commodi officiis veritatis, mollitia adipisci quisquam asperiores accusantium provident soluta possimus temporibus, iure molestiae, maiores optio. In adipisci vero doloribus consectetur, quod asperiores rem dolorem, repudiandae voluptate neque sit iste ipsa beatae cumque a quibusdam earum maiores quisquam nesciunt aperiam ut! Omnis at non cumque fugit ad dolorum inventore, impedit accusamus, commodi debitis dolor quae? Aperiam excepturi animi facilis fuga iusto esse cupiditate totam pariatur asperiores architecto labore maiores sit consectetur similique quas minus provident nulla aspernatur temporibus fugit inventore, recusandae aut nihil repellendus! Eligendi consequatur laborum molestias libero, in recusandae beatae id sit nemo commodi, iure fugit? Ex maxime eaque distinctio veniam officiis ea sunt voluptates magni laborum, sapiente quibusdam dolore ipsum neque minima deleniti aut amet optio hic exercitationem deserunt itaque iure natus, suscipit architecto! Sapiente minus laudantium, culpa cupiditate, voluptates aliquid nobis blanditiis quod consequuntur repudiandae beatae possimus excepturi explicabo, dolorum impedit modi officiis hic libero in ratione eum reprehenderit! Eaque quas aliquid earum voluptatem veritatis deserunt nemo fugit vitae cupiditate molestias dolorum delectus dolores illo, nobis at ducimus corporis enim incidunt ipsam ut explicabo sint, odit iure. Necessitatibus nobis nisi aliquam est saepe iusto sed molestiae ipsam, quas temporibus inventore ut animi sit minus itaque. Perspiciatis architecto laborum, labore odit dolores minima ab assumenda veritatis placeat reprehenderit qui ut minus. Quod molestias nobis expedita voluptatum omnis sint, dolor enim voluptates quasi quaerat quos debitis deleniti veritatis error et placeat porro aliquam. Pariatur cumque ducimus rem exercitationem, corrupti aspernatur non ipsam fuga commodi molestiae laboriosam libero repellendus obcaecati architecto. Dolorem adipisci unde doloribus eaque, qui tempora neque minima, sapiente corrupti veritatis quis repellat ipsum. Quas provident, quasi hic repellat voluptatum id nemo nisi labore non odio beatae reprehenderit nostrum ratione. Magni, molestiae facilis ratione deleniti reprehenderit ut voluptas cum, enim ullam delectus, aperiam doloremque. Molestias, quo facere? Veniam in sunt omnis ratione maiores cumque cupiditate quasi necessitatibus corporis a quae at aliquam, ut eos culpa natus doloremque consequatur? Dolor sed quas atque culpa dolores deserunt aut inventore, voluptate aliquam deleniti eum ex illum, dignissimos incidunt impedit quidem quaerat asperiores corrupti sit esse. Placeat obcaecati assumenda tempora quam libero accusantium voluptate ab tempore? Alias, perspiciatis cumque! Ab ipsum praesentium asperiores, repellat, voluptate, cupiditate quod modi labore explicabo repudiandae laborum! Odio, beatae aspernatur dolores repellat totam ad quam sapiente eaque vero voluptas excepturi sed est mollitia dolorum facere amet doloremque! Perspiciatis necessitatibus quae doloribus enim repellat, amet aspernatur minima sapiente suscipit nesciunt architecto, eligendi hic obcaecati placeat maxime aliquid molestias illo ipsam quos, voluptates laborum in aperiam? Architecto, quibusdam repellat pariatur ad excepturi quod magnam. Debitis, iusto consequuntur explicabo nostrum assumenda harum placeat natus quos repudiandae tempora quo molestiae, molestias modi dolorum eos earum soluta voluptas quasi ducimus nesciunt blanditiis!', '2021-02-24 02:42:29', 'icon-image.jpg'),
(4, 'This is the fourth post of the universe', 'fourth-post', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo cupiditate quas at velit modi magni praesentium? Obcaecati libero rem ducimus quo totam cum voluptate excepturi sequi dolorum doloremque expedita repellat vel fuga, omnis eveniet est fugit voluptates incidunt unde dolores explicabo ipsam accusantium. Ipsam, molestiae facilis! In iusto nemo commodi officiis veritatis, mollitia adipisci quisquam asperiores accusantium provident soluta possimus temporibus, iure molestiae, maiores optio. In adipisci vero doloribus consectetur, quod asperiores rem dolorem, repudiandae voluptate neque sit iste ipsa beatae cumque a quibusdam earum maiores quisquam nesciunt aperiam ut! Omnis at non cumque fugit ad dolorum inventore, impedit accusamus, commodi debitis dolor quae? Aperiam excepturi animi facilis fuga iusto esse cupiditate totam pariatur asperiores architecto labore maiores sit consectetur similique quas minus provident nulla aspernatur temporibus fugit inventore, recusandae aut nihil repellendus! Eligendi consequatur laborum molestias libero, in recusandae beatae id sit nemo commodi, iure fugit? Ex maxime eaque distinctio veniam officiis ea sunt voluptates magni laborum, sapiente quibusdam dolore ipsum neque minima deleniti aut amet optio hic exercitationem deserunt itaque iure natus, suscipit architecto! Sapiente minus laudantium, culpa cupiditate, voluptates aliquid nobis blanditiis quod consequuntur repudiandae beatae possimus excepturi explicabo, dolorum impedit modi officiis hic libero in ratione eum reprehenderit! Eaque quas aliquid earum voluptatem veritatis deserunt nemo fugit vitae cupiditate molestias dolorum delectus dolores illo, nobis at ducimus corporis enim incidunt ipsam ut explicabo sint, odit iure. Necessitatibus nobis nisi aliquam est saepe iusto sed molestiae ipsam, quas temporibus inventore ut animi sit minus itaque. Perspiciatis architecto laborum, labore odit dolores minima ab assumenda veritatis placeat reprehenderit qui ut minus. Quod molestias nobis expedita voluptatum omnis sint, dolor enim voluptates quasi quaerat quos debitis deleniti veritatis error et placeat porro aliquam. Pariatur cumque ducimus rem exercitationem, corrupti aspernatur non ipsam fuga commodi molestiae laboriosam libero repellendus obcaecati architecto. Dolorem adipisci unde doloribus eaque, qui tempora neque minima, sapiente corrupti veritatis quis repellat ipsum. Quas provident, quasi hic repellat voluptatum id nemo nisi labore non odio beatae reprehenderit nostrum ratione. Magni, molestiae facilis ratione deleniti reprehenderit ut voluptas cum, enim ullam delectus, aperiam doloremque. Molestias, quo facere? Veniam in sunt omnis ratione maiores cumque cupiditate quasi necessitatibus corporis a quae at aliquam, ut eos culpa natus doloremque consequatur? Dolor sed quas atque culpa dolores deserunt aut inventore, voluptate aliquam deleniti eum ex illum, dignissimos incidunt impedit quidem quaerat asperiores corrupti sit esse. Placeat obcaecati assumenda tempora quam libero accusantium voluptate ab tempore? Alias, perspiciatis cumque! Ab ipsum praesentium asperiores, repellat, voluptate, cupiditate quod modi labore explicabo repudiandae laborum! Odio, beatae aspernatur dolores repellat totam ad quam sapiente eaque vero voluptas excepturi sed est mollitia dolorum facere amet doloremque! Perspiciatis necessitatibus quae doloribus enim repellat, amet aspernatur minima sapiente suscipit nesciunt architecto, eligendi hic obcaecati placeat maxime aliquid molestias illo ipsam quos, voluptates laborum in aperiam? Architecto, quibusdam repellat pariatur ad excepturi quod magnam. Debitis, iusto consequuntur explicabo nostrum assumenda harum placeat natus quos repudiandae tempora quo molestiae, molestias modi dolorum eos earum soluta voluptas quasi ducimus nesciunt blanditiis!', '2021-02-24 02:45:21', 'newspaper.jpg'),
(5, 'The Fifth Post is The Brand Ambassador Of an Indian Family', 'fifth-post', 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Nemo cupiditate quas at velit modi magni praesentium? Obcaecati libero rem ducimus quo totam cum voluptate excepturi sequi dolorum doloremque expedita repellat vel fuga, omnis eveniet est fugit voluptates incidunt unde dolores explicabo ipsam accusantium. Ipsam, molestiae facilis! In iusto nemo commodi officiis veritatis, mollitia adipisci quisquam asperiores accusantium provident soluta possimus temporibus, iure molestiae, maiores optio. In adipisci vero doloribus consectetur, quod asperiores rem dolorem, repudiandae voluptate neque sit iste ipsa beatae cumque a quibusdam earum maiores quisquam nesciunt aperiam ut! Omnis at non cumque fugit ad dolorum inventore, impedit accusamus, commodi debitis dolor quae? Aperiam excepturi animi facilis fuga iusto esse cupiditate totam pariatur asperiores architecto labore maiores sit consectetur similique quas minus provident nulla aspernatur temporibus fugit inventore, recusandae aut nihil repellendus! Eligendi consequatur laborum molestias libero, in recusandae beatae id sit nemo commodi, iure fugit? Ex maxime eaque distinctio veniam officiis ea sunt voluptates magni laborum, sapiente quibusdam dolore ipsum neque minima deleniti aut amet optio hic exercitationem deserunt itaque iure natus, suscipit architecto! Sapiente minus laudantium, culpa cupiditate, voluptates aliquid nobis blanditiis quod consequuntur repudiandae beatae possimus excepturi explicabo, dolorum impedit modi officiis hic libero in ratione eum reprehenderit! Eaque quas aliquid earum voluptatem veritatis deserunt nemo fugit vitae cupiditate molestias dolorum delectus dolores illo, nobis at ducimus corporis enim incidunt ipsam ut explicabo sint, odit iure. Necessitatibus nobis nisi aliquam est saepe iusto sed molestiae ipsam, quas temporibus inventore ut animi sit minus itaque. Perspiciatis architecto laborum, labore odit dolores minima ab assumenda veritatis placeat reprehenderit qui ut minus. Quod molestias nobis expedita voluptatum omnis sint, dolor enim voluptates quasi quaerat quos debitis deleniti veritatis error et placeat porro aliquam. Pariatur cumque ducimus rem exercitationem, corrupti aspernatur non ipsam fuga commodi molestiae laboriosam libero repellendus obcaecati architecto. Dolorem adipisci unde doloribus eaque, qui tempora neque minima, sapiente corrupti veritatis quis repellat ipsum. Quas provident, quasi hic repellat voluptatum id nemo nisi labore non odio beatae reprehenderit nostrum ratione. Magni, molestiae facilis ratione deleniti reprehenderit ut voluptas cum, enim ullam delectus, aperiam doloremque. Molestias, quo facere? Veniam in sunt omnis ratione maiores cumque cupiditate quasi necessitatibus corporis a quae at aliquam, ut eos culpa natus doloremque consequatur? Dolor sed quas atque culpa dolores deserunt aut inventore, voluptate aliquam deleniti eum ex illum, dignissimos incidunt impedit quidem quaerat asperiores corrupti sit esse. Placeat obcaecati assumenda tempora quam libero accusantium voluptate ab tempore? Alias, perspiciatis cumque! Ab ipsum praesentium asperiores, repellat, voluptate, cupiditate quod modi labore explicabo repudiandae laborum! Odio, beatae aspernatur dolores repellat totam ad quam sapiente eaque vero voluptas excepturi sed est mollitia dolorum facere amet doloremque! Perspiciatis necessitatibus quae doloribus enim repellat, amet aspernatur minima sapiente suscipit nesciunt architecto, eligendi hic obcaecati placeat maxime aliquid molestias illo ipsam quos, voluptates laborum in aperiam? Architecto, quibusdam repellat pariatur ad excepturi quod magnam. Debitis, iusto consequuntur explicabo nostrum assumenda harum placeat natus quos repudiandae tempora quo molestiae, molestias modi dolorum eos earum soluta voluptas quasi ducimus nesciunt blanditiis!', '2021-02-24 02:45:21', 'social-media-keywords.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
