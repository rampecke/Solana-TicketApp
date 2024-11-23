import Foundation

// TODO: - In construction

public enum TokenSwapProgram {
    // MARK: - Nested type

    private enum Index: UInt8, BytesEncodable {
        case initialize = 0
        case swap = 1
        case deposit = 2
        case withdraw = 3
    }

    // MARK: - Instruction builder

    public static func swapInstruction(
        tokenSwap: PublicKey,
        authority: PublicKey,
        userTransferAuthority: PublicKey,
        userSource: PublicKey,
        poolSource: PublicKey,
        poolDestination: PublicKey,
        userDestination: PublicKey,
        poolMint: PublicKey,
        feeAccount: PublicKey,
        hostFeeAccount: PublicKey?,
        swapProgramId: PublicKey,
        tokenProgramId: PublicKey,
        amountIn: UInt64,
        minimumAmountOut: UInt64
    ) -> TransactionInstruction {
        var keys = [
            AccountMeta(publicKey: tokenSwap, isSigner: false, isWritable: false),
            AccountMeta(publicKey: authority, isSigner: false, isWritable: false),
            AccountMeta(publicKey: userTransferAuthority, isSigner: true, isWritable: false),
            AccountMeta(publicKey: userSource, isSigner: false, isWritable: true),
            AccountMeta(publicKey: poolSource, isSigner: false, isWritable: true),
            AccountMeta(publicKey: poolDestination, isSigner: false, isWritable: true),
            AccountMeta(publicKey: userDestination, isSigner: false, isWritable: true),
            AccountMeta(publicKey: poolMint, isSigner: false, isWritable: true),
            AccountMeta(publicKey: feeAccount, isSigner: false, isWritable: true),
            AccountMeta(publicKey: tokenProgramId, isSigner: false, isWritable: false),
        ]

        if let hostFeeAccount = hostFeeAccount {
            keys.append(AccountMeta(publicKey: hostFeeAccount, isSigner: false, isWritable: true))
        }

        return TransactionInstruction(
            keys: keys,
            programId: swapProgramId,
            data: [Index.swap, amountIn, minimumAmountOut]
        )
    }

    // MARK: - Deposit

    public static func depositInstruction(
        tokenSwap: PublicKey,
        authority: PublicKey,
        sourceA: PublicKey,
        sourceB: PublicKey,
        intoA: PublicKey,
        intoB: PublicKey,
        poolToken: PublicKey,
        poolAccount: PublicKey,
        tokenProgramId: PublicKey,
        swapProgramId: PublicKey,
        poolTokenAmount: UInt64,
        maximumTokenA: UInt64,
        maximumTokenB: UInt64
    ) -> TransactionInstruction {
        TransactionInstruction(
            keys: [
                AccountMeta(publicKey: tokenSwap, isSigner: false, isWritable: false),
                AccountMeta(publicKey: authority, isSigner: false, isWritable: false),
                AccountMeta(publicKey: sourceA, isSigner: false, isWritable: true),
                AccountMeta(publicKey: sourceB, isSigner: false, isWritable: true),
                AccountMeta(publicKey: intoA, isSigner: false, isWritable: true),
                AccountMeta(publicKey: intoB, isSigner: false, isWritable: true),
                AccountMeta(publicKey: poolToken, isSigner: false, isWritable: true),
                AccountMeta(publicKey: poolAccount, isSigner: false, isWritable: true),
                AccountMeta(publicKey: tokenProgramId, isSigner: false, isWritable: true),
            ],
            programId: swapProgramId,
            data: [Index.deposit, poolTokenAmount, maximumTokenA, maximumTokenB]
        )
    }

    // MARK: - Withdraw

    public static func withdrawInstruction(
        tokenSwap: PublicKey,
        authority: PublicKey,
        poolMint: PublicKey,
        feeAccount: PublicKey,
        sourcePoolAccount: PublicKey,
        fromA: PublicKey,
        fromB: PublicKey,
        userAccountA: PublicKey,
        userAccountB: PublicKey,
        swapProgramId: PublicKey,
        tokenProgramId: PublicKey,
        poolTokenAmount: UInt64,
        minimumTokenA: UInt64,
        minimumTokenB: UInt64
    ) -> TransactionInstruction {
        TransactionInstruction(
            keys: [
                AccountMeta(publicKey: tokenSwap, isSigner: false, isWritable: false),
                AccountMeta(publicKey: authority, isSigner: false, isWritable: false),
                AccountMeta(publicKey: poolMint, isSigner: false, isWritable: true),
                AccountMeta(publicKey: sourcePoolAccount, isSigner: false, isWritable: true),
                AccountMeta(publicKey: fromA, isSigner: false, isWritable: true),
                AccountMeta(publicKey: fromB, isSigner: false, isWritable: true),
                AccountMeta(publicKey: userAccountA, isSigner: false, isWritable: true),
                AccountMeta(publicKey: userAccountB, isSigner: false, isWritable: true),
                AccountMeta(publicKey: feeAccount, isSigner: false, isWritable: false),
                AccountMeta(publicKey: tokenProgramId, isSigner: false, isWritable: false),
            ],
            programId: swapProgramId,
            data: [Index.withdraw, poolTokenAmount, minimumTokenA, minimumTokenB]
        )
    }

    //        public func initialize(
    //            tokenSwapAccount: PublicKey,
    //            authority: PublicKey,
    //            tokenAccountA: PublicKey,
    //            tokenAccountB: PublicKey,
    //            tokenPool: PublicKey,
    //            feeAccount: PublicKey,
    //            tokenAccountPool: PublicKey,
    //            tokenProgramId: PublicKey,
    //            swapProgramId: PublicKey,
    //            nonce: UInt8,
    //            curveType: UInt8,
    //            tradeFeeNumerator: UInt64,
    //            tradeFeeDenominator: UInt64,
    //            ownerTradeFeeNumerator: UInt64,
    //            ownerTradeFeeDenominator: UInt64,
    //            ownerWithdrawFeeNumerator: UInt64,
    //            ownerWithdrawFeeDenominator: UInt64,
    //            hostFeeNumerator: UInt64,
    //            hostFeeDenominator: UInt64
    //        ) -> TransactionInstruction {
    //            let keys = [
    //                AccountMeta(publicKey: tokenSwapAccount, isSigner: false, isWritable: true),
    //                AccountMeta(publicKey: authority, isSigner: false, isWritable: false),
    //                AccountMeta(publicKey: authority, isSigner: false, isWritable: false),
    //                AccountMeta(publicKey: tokenAccountA, isSigner: false, isWritable: false),
    //                AccountMeta(publicKey: tokenAccountB, isSigner: false, isWritable: false),
    //                AccountMeta(publicKey: tokenPool, isSigner: false, isWritable: true),
    //                AccountMeta(publicKey: feeAccount, isSigner: false, isWritable: false),
    //                AccountMeta(publicKey: tokenAccountPool, isSigner: false, isWritable: true),
    //                AccountMeta(publicKey: tokenProgramId, isSigner: false, isWritable: false)
    //            ]
    //            var data = TransactionType.initialize.encode([
    //                nonce,
    //                tradeFeeNumerator,
    //                tradeFeeDenominator,
    //                ownerTradeFeeNumerator,
    //                ownerTradeFeeDenominator,
    //                ownerWithdrawFeeNumerator,
    //                ownerWithdrawFeeDenominator,
    //                hostFeeNumerator,
    //                hostFeeDenominator,
    //                curveType,
    //                Data(capacity: 32)
    //            ])
    //            return TransactionInstruction(keys: keys, programId: , data: data.bytes)
    //        }
}
