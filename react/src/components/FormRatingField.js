import React from 'react';


const FormRatingField = (props) => {
  return (
    <label onChange={props.onChange}>{props.label}
      <input
        name={props.name}
        type='text'
        value={props.content}
      />
    </label>
  );
}

export default FormRatingField;
