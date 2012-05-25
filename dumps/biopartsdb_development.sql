/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50150
 Source Host           : localhost
 Source Database       : biopartsdb_development

 Target Server Type    : MySQL
 Target Server Version : 50150
 File Encoding         : utf-8

 Date: 05/24/2012 20:10:48 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `device_types`
-- ----------------------------
DROP TABLE IF EXISTS `device_types`;
CREATE TABLE `device_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `device_types`
-- ----------------------------
BEGIN;
INSERT INTO `device_types` VALUES ('1', 'PCR machine', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', 'pcr', '2012-05-24 20:33:32', '2012-05-24 20:33:32'), ('3', 'pcr', '2012-05-24 20:34:21', '2012-05-24 20:34:21');
COMMIT;

-- ----------------------------
--  Table structure for `devices`
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_type_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_devices_on_device_type_id` (`device_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `devices`
-- ----------------------------
BEGIN;
INSERT INTO `devices` VALUES ('1', '2', 'Veriti I', '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('2', '2', 'Test PCR Machine', '2012-05-24 20:33:33', '2012-05-24 20:33:33'), ('3', '2', 'Test PCR Machine', '2012-05-24 20:34:21', '2012-05-24 20:34:21');
COMMIT;

-- ----------------------------
--  Table structure for `features`
-- ----------------------------
DROP TABLE IF EXISTS `features`;
CREATE TABLE `features` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `so` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `namespace` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `definition` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `features`
-- ----------------------------
BEGIN;
INSERT INTO `features` VALUES ('1', 'SO:0000167', 'promoter', 'sequence', 'A regulatory_region composed of the TSS(s) and binding sites for TF_complexes of the basal transcription machinery.', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `fpcr_products`
-- ----------------------------
DROP TABLE IF EXISTS `fpcr_products`;
CREATE TABLE `fpcr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `fpcr_id` int(11) DEFAULT NULL,
  `tpcr_product_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fpcr_products_on_user_id` (`user_id`),
  KEY `index_fpcr_products_on_fpcr_id` (`fpcr_id`),
  KEY `index_fpcr_products_on_tpcr_product_id` (`tpcr_product_id`),
  KEY `index_fpcr_products_on_quality_control_id` (`quality_control_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `fpcr_products`
-- ----------------------------
BEGIN;
INSERT INTO `fpcr_products` VALUES ('7', null, '5', '6', '7', '2012-05-24 21:42:42', '2012-05-24 21:43:36');
COMMIT;

-- ----------------------------
--  Table structure for `fpcrs`
-- ----------------------------
DROP TABLE IF EXISTS `fpcrs`;
CREATE TABLE `fpcrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_fpcrs_on_user_id` (`user_id`),
  KEY `index_fpcrs_on_status_id` (`status_id`),
  KEY `index_fpcrs_on_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `fpcrs`
-- ----------------------------
BEGIN;
INSERT INTO `fpcrs` VALUES ('5', '5', '6', '3', '1', '2012-05-24 21:42:42', '2012-05-24 21:42:52');
COMMIT;

-- ----------------------------
--  Table structure for `ligation_products`
-- ----------------------------
DROP TABLE IF EXISTS `ligation_products`;
CREATE TABLE `ligation_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ligation_id` int(11) DEFAULT NULL,
  `pcr_product_id` int(11) DEFAULT NULL,
  `pcr_product_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `plasmid_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ligation_products_on_user_id` (`user_id`),
  KEY `index_ligation_products_on_plasmid_id` (`plasmid_id`),
  KEY `index_ligation_products_on_quality_control_id` (`quality_control_id`),
  KEY `index_ligation_products_on_ligation_id` (`ligation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `ligation_products`
-- ----------------------------
BEGIN;
INSERT INTO `ligation_products` VALUES ('1', null, '1', '60', 'SpcrProduct', '1', '9', '2012-05-24 22:38:07', '2012-05-24 23:25:29'), ('2', null, '1', '7', 'FpcrProduct', '1', '9', '2012-05-24 22:38:07', '2012-05-24 23:25:29');
COMMIT;

-- ----------------------------
--  Table structure for `ligations`
-- ----------------------------
DROP TABLE IF EXISTS `ligations`;
CREATE TABLE `ligations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_ligations_on_user_id` (`user_id`),
  KEY `index_ligations_on_status_id` (`status_id`),
  KEY `index_ligations_on_protocol_id` (`protocol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `ligations`
-- ----------------------------
BEGIN;
INSERT INTO `ligations` VALUES ('1', '5', '10', '5', '2012-05-24 22:38:07', '2012-05-24 23:32:42');
COMMIT;

-- ----------------------------
--  Table structure for `locations`
-- ----------------------------
DROP TABLE IF EXISTS `locations`;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organism_id` int(11) DEFAULT NULL,
  `chromosome` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `stop` int(11) DEFAULT NULL,
  `strand` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locations_on_organism_id` (`organism_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `locations`
-- ----------------------------
BEGIN;
INSERT INTO `locations` VALUES ('1', '1', 'chr02', '60736', '61198', '-1', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `oligo_plate_wells`
-- ----------------------------
DROP TABLE IF EXISTS `oligo_plate_wells`;
CREATE TABLE `oligo_plate_wells` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oligo_plate_id` int(11) DEFAULT NULL,
  `oligo_id` int(11) DEFAULT NULL,
  `well` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oligo_plate_wells_on_oligo_plate_id` (`oligo_plate_id`),
  KEY `index_oligo_plate_wells_on_oligo_id` (`oligo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `oligo_plate_wells`
-- ----------------------------
BEGIN;
INSERT INTO `oligo_plate_wells` VALUES ('1', '1', '1', 'A01', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `oligo_plates`
-- ----------------------------
DROP TABLE IF EXISTS `oligo_plates`;
CREATE TABLE `oligo_plates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oligo_plates_on_vendor_id` (`vendor_id`),
  KEY `index_oligo_plates_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `oligo_plates`
-- ----------------------------
BEGIN;
INSERT INTO `oligo_plates` VALUES ('1', 'JHU_PARTS_2012_OLIGO_1', '1', '1', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `oligos`
-- ----------------------------
DROP TABLE IF EXISTS `oligos`;
CREATE TABLE `oligos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `part_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `start` int(11) DEFAULT NULL,
  `stop` int(11) DEFAULT NULL,
  `sequence` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_oligos_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `oligos`
-- ----------------------------
BEGIN;
INSERT INTO `oligos` VALUES ('1', '1', 'yeast_promoter_YBL087C.o01', '1', '150', 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTAC', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `organisms`
-- ----------------------------
DROP TABLE IF EXISTS `organisms`;
CREATE TABLE `organisms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latin` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gbtaxonid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `organisms`
-- ----------------------------
BEGIN;
INSERT INTO `organisms` VALUES ('1', 'yeast', 'Saccharomyces cerevisiae', '4932', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `parts`
-- ----------------------------
DROP TABLE IF EXISTS `parts`;
CREATE TABLE `parts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `sequence_id` int(11) DEFAULT NULL,
  `feature_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_parts_on_location_id` (`location_id`),
  KEY `index_parts_on_sequence_id` (`sequence_id`),
  KEY `index_parts_on_feature_id` (`feature_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `parts`
-- ----------------------------
BEGIN;
INSERT INTO `parts` VALUES ('1', 'yeast_promoter_YBL087C', '1', '1', '1', '2012-05-20 13:34:49', '2012-05-20 13:34:49'), ('2', 'yeast_gene_YBL087C', '1', '1', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `pcr_gel_images`
-- ----------------------------
DROP TABLE IF EXISTS `pcr_gel_images`;
CREATE TABLE `pcr_gel_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcr_gel_id` int(11) DEFAULT NULL,
  `pcr_gel_image_file` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pcr_gel_images_on_pcr_gel_id` (`pcr_gel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `pcr_gel_images`
-- ----------------------------
BEGIN;
INSERT INTO `pcr_gel_images` VALUES ('19', '4', 'gel_16112010.jpg', '2012-05-24 00:22:40', '2012-05-24 00:22:40');
COMMIT;

-- ----------------------------
--  Table structure for `pcr_gel_lanes`
-- ----------------------------
DROP TABLE IF EXISTS `pcr_gel_lanes`;
CREATE TABLE `pcr_gel_lanes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcr_gel_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `pcr_product_id` int(11) DEFAULT NULL,
  `pcr_product_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pcr_gel_lanes_on_pcr_gel_id` (`pcr_gel_id`),
  KEY `index_pcr_gel_lanes_on_quality_control_id` (`quality_control_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `pcr_gel_lanes`
-- ----------------------------
BEGIN;
INSERT INTO `pcr_gel_lanes` VALUES ('22', '10', '7', '60', 'SpcrProduct', '2012-05-24 21:43:20', '2012-05-24 23:30:03'), ('23', '10', '7', '6', 'TpcrProduct', '2012-05-24 21:43:20', '2012-05-24 23:30:03'), ('24', '10', '7', '7', 'FpcrProduct', '2012-05-24 21:43:20', '2012-05-24 23:30:03');
COMMIT;

-- ----------------------------
--  Table structure for `pcr_gels`
-- ----------------------------
DROP TABLE IF EXISTS `pcr_gels`;
CREATE TABLE `pcr_gels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_pcr_gels_on_user_id` (`user_id`),
  KEY `index_pcr_gels_on_protocol_id` (`protocol_id`),
  KEY `index_pcr_gels_on_status_id` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `pcr_gels`
-- ----------------------------
BEGIN;
INSERT INTO `pcr_gels` VALUES ('10', '5', '4', '8', '2012-05-24 21:43:20', '2012-05-24 21:43:50');
COMMIT;

-- ----------------------------
--  Table structure for `plasmids`
-- ----------------------------
DROP TABLE IF EXISTS `plasmids`;
CREATE TABLE `plasmids` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vendor_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_plasmids_on_vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `plasmids`
-- ----------------------------
BEGIN;
INSERT INTO `plasmids` VALUES ('1', '1', 'pGEM-T', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `protocol_reagents`
-- ----------------------------
DROP TABLE IF EXISTS `protocol_reagents`;
CREATE TABLE `protocol_reagents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `protocol_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stock_concentration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `final_concentration` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `volume_reaction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_protocol_reagents_on_protocol_id` (`protocol_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `protocol_reagents`
-- ----------------------------
BEGIN;
INSERT INTO `protocol_reagents` VALUES ('1', null, null, null, null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `protocols`
-- ----------------------------
DROP TABLE IF EXISTS `protocols`;
CREATE TABLE `protocols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8_unicode_ci,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `scaling_factor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_protocols_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `protocols`
-- ----------------------------
BEGIN;
INSERT INTO `protocols` VALUES ('1', 'Spcr', 'PCR', 'a perfect pcr program', '5', '2012-05-20 17:38:30', '2012-05-20 17:38:36', '3'), ('2', 'Tpcr', 'tPCR', 'perfect tpcr', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3'), ('3', 'Fpcr', 'fPCR', 'perfect fPCR', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3'), ('4', 'PcrGel', 'PCR Gel Protocol', 'test', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '3'), ('5', 'Ligation', 'Ligation Protocol', null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '0');
COMMIT;

-- ----------------------------
--  Table structure for `quality_controls`
-- ----------------------------
DROP TABLE IF EXISTS `quality_controls`;
CREATE TABLE `quality_controls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `quality_controls`
-- ----------------------------
BEGIN;
INSERT INTO `quality_controls` VALUES ('1', 'Spcr', 'PASS', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21'), ('2', 'Spcr', 'FAIL', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21'), ('3', 'Tpcr', 'PASS', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21'), ('4', 'Tpcr', 'FAIL', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21'), ('5', 'Fpcr', 'PASS', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21'), ('6', 'Fpcr', 'FAIL', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21'), ('7', 'PcrGelLane', 'PASS', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('8', 'PcrGelLane', 'FAIL', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('9', 'Ligation', 'PASS', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00'), ('10', 'Ligation', 'FAIL', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00');
COMMIT;

-- ----------------------------
--  Table structure for `schema_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `schema_migrations`
-- ----------------------------
BEGIN;
INSERT INTO `schema_migrations` VALUES ('20120519235331'), ('20120519235438'), ('20120519235545'), ('20120519235611'), ('20120519235937'), ('20120520000405'), ('20120520004455'), ('20120520004522'), ('20120520004837'), ('20120520005554'), ('20120520124535'), ('20120520124730'), ('20120520125444'), ('20120520125515'), ('20120520125543'), ('20120520125611'), ('20120520145623'), ('20120521203336'), ('20120521203409'), ('20120521203509'), ('20120521203550'), ('20120521231022'), ('20120522175036'), ('20120522183620'), ('20120522183822'), ('20120522183859'), ('20120523131504'), ('20120523131603'), ('20120523132857'), ('20120524141200'), ('20120524141210'), ('20120524141806'), ('20120524192041'), ('20120524222423');
COMMIT;

-- ----------------------------
--  Table structure for `sequences`
-- ----------------------------
DROP TABLE IF EXISTS `sequences`;
CREATE TABLE `sequences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `sequences`
-- ----------------------------
BEGIN;
INSERT INTO `sequences` VALUES ('1', 'AATATTTGTATTGTTTTATGTAATTATAATCTTAAGCTTGCAATACCAATCACTATTACCATGTTAATGATCCCCCAGATAAAAAGACAAGACAGAGCATATATCAGACTACATTAACATCTGTACACCCCCAACTGCTTTGAAAAAACCCATGCAGTTATTATTTTCAACAGACCAAGTTTTTTTATCGCTTATCCGGCTCACAGAACGAGCCGTACAACCGTCATCAGACTTGCATGGAAATGTTGAAAAAGAGGTAAAAAAGAAAATATCAAACCCAAACACGCTCGGGCTGAAAAATTAATATGGCAGGAAACGAACTGTAGCCATAATGTACCTGTTCCCGCTAATAGTAATACCATCGTATTGCTAAGGTTAGTAGCTAAAAATCTCTTACTTTCTTTATTTTGACTCTTAGGTCTTACAAGCAATACAAAACCAACACACCTATATATAACTAATA', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

-- ----------------------------
--  Table structure for `spcr_products`
-- ----------------------------
DROP TABLE IF EXISTS `spcr_products`;
CREATE TABLE `spcr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `spcr_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_apcr_products_on_apcr_id` (`spcr_id`),
  KEY `index_apcr_products_on_quality_control_id` (`quality_control_id`),
  KEY `index_apcr_products_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `spcr_products`
-- ----------------------------
BEGIN;
INSERT INTO `spcr_products` VALUES ('60', null, '33', '7', '1', '2012-05-24 21:41:19', '2012-05-24 21:43:36');
COMMIT;

-- ----------------------------
--  Table structure for `spcrs`
-- ----------------------------
DROP TABLE IF EXISTS `spcrs`;
CREATE TABLE `spcrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_apcrs_on_status_id` (`status_id`),
  KEY `index_apcrs_on_protocol_id` (`protocol_id`),
  KEY `index_apcrs_on_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `spcrs`
-- ----------------------------
BEGIN;
INSERT INTO `spcrs` VALUES ('33', '5', '2', '1', '1', '2012-05-24 21:41:19', '2012-05-24 21:41:34');
COMMIT;

-- ----------------------------
--  Table structure for `statuses`
-- ----------------------------
DROP TABLE IF EXISTS `statuses`;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `default` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `statuses`
-- ----------------------------
BEGIN;
INSERT INTO `statuses` VALUES ('1', 'Spcr', 'Pending', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21', '1'), ('2', 'Spcr', 'Finished', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21', null), ('3', 'Tpcr', 'Pending', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21', '1'), ('4', 'Tpcr', 'Finished', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21', null), ('5', 'Fpcr', 'Pending', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21', '1'), ('6', 'Fpcr', 'Finished', null, '2012-05-24 20:34:21', '2012-05-24 20:34:21', null), ('7', 'PcrGel', 'Pending', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'), ('8', 'PcrGel', 'Finished', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', null), ('9', 'Ligation', 'Pending', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', '1'), ('10', 'Ligation', 'Finished', null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', null), ('11', null, null, null, '0000-00-00 00:00:00', '0000-00-00 00:00:00', null);
COMMIT;

-- ----------------------------
--  Table structure for `strains`
-- ----------------------------
DROP TABLE IF EXISTS `strains`;
CREATE TABLE `strains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `organism_id` int(11) DEFAULT NULL,
  `vendor_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_strains_on_organism_id` (`organism_id`),
  KEY `index_strains_on_vendor_id` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Table structure for `tasks`
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tasks_on_user_id` (`user_id`),
  KEY `index_tasks_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tasks`
-- ----------------------------
BEGIN;
INSERT INTO `tasks` VALUES ('1', '5', '1', '2012-05-20 18:06:08', '2012-05-20 18:06:11');
COMMIT;

-- ----------------------------
--  Table structure for `tpcr_products`
-- ----------------------------
DROP TABLE IF EXISTS `tpcr_products`;
CREATE TABLE `tpcr_products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `tpcr_id` int(11) DEFAULT NULL,
  `quality_control_id` int(11) DEFAULT NULL,
  `part_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tpcr_products_on_user_id` (`user_id`),
  KEY `index_tpcr_products_on_tpcr_id` (`tpcr_id`),
  KEY `index_tpcr_products_on_quality_control_id` (`quality_control_id`),
  KEY `index_tpcr_products_on_part_id` (`part_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tpcr_products`
-- ----------------------------
BEGIN;
INSERT INTO `tpcr_products` VALUES ('6', null, '5', '7', '1', '2012-05-24 21:42:03', '2012-05-24 21:43:36');
COMMIT;

-- ----------------------------
--  Table structure for `tpcrs`
-- ----------------------------
DROP TABLE IF EXISTS `tpcrs`;
CREATE TABLE `tpcrs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `protocol_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_tpcrs_on_user_id` (`user_id`),
  KEY `index_tpcrs_on_status_id` (`status_id`),
  KEY `index_tpcrs_on_protocol_id` (`protocol_id`),
  KEY `index_tpcrs_on_device_id` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `tpcrs`
-- ----------------------------
BEGIN;
INSERT INTO `tpcrs` VALUES ('5', '5', '4', '2', '1', '2012-05-24 21:42:03', '2012-05-24 21:42:22');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', null, 'Giovanni Stracquadanio', 'stracquadanio@jhu.edu', 'facebook', '2012-05-20 13:34:49', '2012-05-20 13:34:49'), ('5', 'https://www.google.com/accounts/o8/id?id=AItOawlskY2r6YJYF1OlA0bsQbVchl2T2M9prnA', 'Giovanni Stracquadanio', 'stracquadanio@gmail.com', 'google', '2012-05-20 21:26:18', '2012-05-21 00:33:31'), ('8', 'https://www.google.com/accounts/o8/id?id=AItOawkaKkPIPnj5lXAU5ToyltXtcKO5CMOXnHQ', 'Sarah Richardson', 'smrichardson@lbl.gov', 'google', '2012-05-23 18:17:36', '2012-05-23 18:17:36');
COMMIT;

-- ----------------------------
--  Table structure for `vendors`
-- ----------------------------
DROP TABLE IF EXISTS `vendors`;
CREATE TABLE `vendors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
--  Records of `vendors`
-- ----------------------------
BEGIN;
INSERT INTO `vendors` VALUES ('1', 'IDT', '2012-05-20 13:34:49', '2012-05-20 13:34:49');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
