# This file was generated, do not modify it. # hide
missing_data = Vector{Missing}(missing, 1) # vector of `missing`
model_predict = dice_throw(missing_data) # instantiate the "predictive model"
prior_check = predict(model_predict, prior_chain);