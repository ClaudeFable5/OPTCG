-- AUTO-GENERATED: OP09-078 / 고무고무 기간트
-- rules_id=OP09-078 script_id=880001174 fingerprint=d5749a98afae0863cd3f8b8392aeb6186e5f2ec556adcbeb079841b0b36cdcc0
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-078]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=4000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={
          {
            count=2,
            op=[[RETURN_DON]],
          },
          {
            count=1,
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】두웅!!-2, 자신의 패 1장을 버릴 수 있다: 자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +4000. 그 후, 카드를 2장 뽑는다.]],
        timings={
          [[COUNTER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-078]],
    schema_version=1,
  })
end
