-- AUTO-GENERATED: OP03-114 / 샬롯 링링
-- rules_id=OP03-114 script_id=880000480 fingerprint=b5a0765d0a29e3510cb04980d78a133e84c898df7e8398a4d99ddabf3d996129
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-114]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빅 맘 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《빅 맘 해적단》 특징을 가진 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다. 그 후, 상대의 라이프 위에서 1장까지를 트래시로 보낸다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-114]],
    schema_version=1,
  })
end
