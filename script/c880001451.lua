-- AUTO-GENERATED: OP11-117 / 어인섬
-- rules_id=OP11-117 script_id=880001451 fingerprint=b8cd209211f7d52c6e34e9c076edda29194215423da6615ae379c9890df3b49e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-117]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              filter={
                trait_any={
                  [[해왕류]],
                  [[어인족]],
                  [[인어족]],
                },
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            name=[[시라호시]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=1,
            faceup=true,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 리더가 「시라호시」인 경우, 자신의 라이프 위에서 1장을 앞면으로 할 수 있다: 이번 턴 동안, 자신의 《해왕류》 또는 《어인족》 또는 《인어족》 특징을 가진 캐릭터 1장까지의 파워 +1000.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-117]],
    schema_version=1,
  })
end
