'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class user1 extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  user1.init({
    firstName_user1: DataTypes.STRING,
    lastName_user1: DataTypes.STRING,
    email_user_1: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'user1',
  });
  return user1;
};