import React from 'react';

export default function FrenchCurlHair({ language }) {
  const isFrench = language === 'fr';

  return (
    <div className="hair-guide-card french-curl-card">
      <div className="french-curl-photo">
        <img
          src="/images/french-curl-cutout.webp"
          alt={isFrench
            ? 'Paquet de mèches Freetress 3X French Curl Braid, 22 pouces, noires'
            : 'Freetress 3X French Curl Braid hair package, 22 inches, black'}
          loading="lazy"
          width="531"
          height="794"
        />
      </div>
      <h3>{isFrench ? 'Cheveux French Curl' : 'French Curl Hair'}</h3>
      <p>
        {isFrench
          ? 'Pour les styles French Curl, voici les mèches recommandées : Freetress 3X French Curl Braid, 22 pouces.'
          : 'For French Curl styles, the recommended hair is Freetress 3X French Curl Braid, 22 inches.'}
      </p>
    </div>
  );
}
