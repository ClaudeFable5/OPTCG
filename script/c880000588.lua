-- AUTO-GENERATED: OP04-096 / 코리다 콜로세움
-- rules_id=OP04-096 script_id=880000588 fingerprint=7509039d4a095d45cc6709d52fc12aab02897aea74bee0902af37c4da77a91cb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP04-096]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[TURN_PLAYED]],
            op=[[ALLOW_ATTACK_CHARACTER]],
            selector={
              count=0,
              filter={
                trait=[[드레스로자]],
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[드레스로자]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[자신의 리더가 《드레스로자》 특징을 가진 경우, 자신의 《드레스로자》 특징을 가진 캐릭터는 등장한 턴에 캐릭터를 어택할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP04-096]],
    schema_version=1,
  })
end
