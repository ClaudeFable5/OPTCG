-- AUTO-GENERATED: OP15-111 / 몽블랑 노랜드
-- rules_id=OP15-111 script_id=880002413 fingerprint=4a0b28a90c2cacd8d5f5d4aba25ff27ad824a490916e08b10dc1546db5c6e83a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-111]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[ALLOW_ATTACK_CHARACTER]],
            selector={
              count=1,
              filter={
                name=[[카르가라]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 「카르가라」 1장까지는 이번 턴 동안 【속공: 캐릭터】를 얻는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-111]],
    schema_version=1,
  })
end
