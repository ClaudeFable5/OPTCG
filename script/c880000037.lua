-- AUTO-GENERATED: EB01-038 / 뉴하프웨이
-- rules_id=EB01-038 script_id=880000037 fingerprint=119f916fa5db07a16e170757cb2fe2d784f25637e08316f51bc69a8aa9b6b7a2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-038]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[CHANGE_ATTACK_TARGET]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 『바로크 워크스』를 포함한 특징을 가진 경우, 자신의 캐릭터를 1장 선택한다. 선택한 캐릭터로 어택 대상을 변경한다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[두웅!!-1: 카드를 2장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-038]],
    schema_version=1,
  })
end
