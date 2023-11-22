// Header.js

import Image from 'next/image';

const Header = () => {
  return (
    <div className="hd1 bg-black p-3 md:p-4 w-full flex items-center justify-between">
      <div className="flex items-center">
        <div className="mr-2">
          <Image src="/mstile-150x150.png" alt="Logo" width={100} height={100} />
        </div>
        <h1 className="text-3xl md:text-4xl font-bold" style={{ color: '#047857', textAlign: 'left', paddingRight: '5%' }}>
          WombatAI
        </h1>
        <div className="flex items-center">
          <a href="/" className="text-white hover:text-gray-300 transition duration-300">
            Dashboard
          </a>
          <a href="/settings" className="text-white hover:text-gray-300 transition duration-300 ml-2">
            Settings
          </a>
        </div>
      </div>
    </div>
  );
};

export default Header;
