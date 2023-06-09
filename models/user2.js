'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class user2 extends Model {
    /**
     * Helper method for defining associations.
     * This method is not a part of Sequelize lifecycle.
     * The `models/index` file will call this method automatically.
     */
    static associate(models) {
      // define association here
    }
  }
  user2.init({
    firstName_user2: DataTypes.STRING,
    lastName_user2: DataTypes.STRING,
    email_user_2: DataTypes.STRING
  }, {
    sequelize,
    modelName: 'user2',
  });
  return user2;
};