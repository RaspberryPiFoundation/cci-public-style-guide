module ColorsHelper
  def colors
    {
      'greyscale': {
        'grey':          '333333',
        'grey-med':      '848484',
        'grey-light':    'C2C2C2',
        'grey-lighter':  'E0E0E0',
        'grey-lightest': 'F5F6F9'
      },
      'highlights': {
        'blue':          '5290D2',
        'blue-light':    '80ACDB',
        'blue-dark':     '3B7ABC'
      },
      'success': {
        'green':         '339933',
        'green-light':   '67B542',
        'green-dark':    '3D6D27'
      },
      'warning':  {
        'yellow':        'FFF578',
        'yellow-light':  'FFF5AF',
        'yellow-dark':   'FFEB56'
      },
      'danger':  {
        'red':           'FF5252',
        'red-light':     'F2918B',
        'red-dark':      'EE4D3A'
      }
    }
  end
end
